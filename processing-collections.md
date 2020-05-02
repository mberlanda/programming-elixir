# ch10 Processing Collections—Enum and Stream

## Enum—Processing Collections

<https://hexdocs.pm/elixir/Enum.html>

```exs
# convert collection to list
list = Enum.to_list(1..5)

# concatenate collections
Enum.concat([1,2,3], [4,5,6])
Enum.concat([1,2,3], 'abc')

Enum.map(list, &(&1 * 10))
Enum.map(list, &String.duplicate("*", &1)

Enum.at(10..20, 3)
Enum.at(10..20, 20, :no_one_here)

require Integer
Enum.filter(list, &Integer.is_even/1)
Enum.reject(list, &Integer.is_even/1)

Enum.sort ["there", "was", "a", "crooked", "man"]
Enum.sort ["there", "was", "a", "crooked", "man"], &(String.length(&1) <= String.length(&2))


Enum.max ["there", "was", "a", "crooked", "man"]
Enum.max_by ["there", "was", "a", "crooked", "man"], &String.length/1

Enum.take(list, 3)
Enum.take_every list, 2
Enum.take_while(list, &(&1 < 4))
Enum.split(list, 3)
Enum.split_while(list, &(&1 < 4))

Enum.join(list)
Enum.join(list, ",")

Enum.all?(list, &(&1 < 4))
Enum.any?(list, &(&1 < 4))
Enum.member?(list, 4)
Enum.empty?(list)

Enum.zip(list, [:a, :b, :c])
Enum.with_index(["once", "upon", "a", "time"])

Enum.reduce(1..100, &(&1 + &2))
Enum.reduce(["now", "is", "the", "time"], fn word, longest ->
  if String.length(word) > String.length(longest) do
    word
  else
    longest
  end
end)
Enum.reduce(["now", "is", "the", "time"], 0, fn word, longest ->
  if String.length(word) > longest, do: String.length(word), else: longest
end)

# Deal a hand of cards
import Enum
deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit,rank]
deck |> shuffle |> take(13)
hands = deck |> shuffle |> chunk(13)
```

`elixir enum/ex-mylist.exs`

## Streams - Lazy Enumerables

```
$ elixir enum/pipeline.exs
[1, 3, 7, 13, 21]
$ elixir enum/longest_line.exs   
electroencephalograph's
```

Both examples are suboptimal since each call to `Enum` is self-contained.
We do not need to store the entire collection as an intermediary step.

### A Stream is a Composable Enumerator

```exs
s = Stream.map [1, 3, 5, 7], &(&1 + 1)
Enum.to_list s

squares = Stream.map [1, 2, 3, 4], &(&1 * &1)
plus_ones = Stream.map squares, &(&1 + 1)
odds = Stream.filter plus_ones, fn x -> rem(x, 2) == 1 end
Enum.to_list odds
```

### Infinite Streams

```exs
Enum.map(1..10_000_000, &(&1+1)) |> Enum.take(5) # Takes a few seconds
Stream.map(1..10_000_000, &(&1+1)) |> Enum.take(5)
```

### Create Your Own Streams

Helpful wrapping functions: `cycle`, `repeatedly`, `iterate`, `unfold`, `resource`

```exs
Stream.cycle(~w{ green white }) |>
Stream.zip(1..5) |>
Enum.map(fn {class, value} ->
  "<tr class='#{class}'><td>#{value}</td></tr>\n" end) |>
IO.puts

Stream.repeatedly(fn -> true end) |> Enum.take(3)
Stream.repeatedly(&:random.uniform/0) |> Enum.take(3)

Stream.iterate(0, &(&1+1)) |> Enum.take(5)
Stream.iterate(2, &(&1*&1)) |> Enum.take(5)
Stream.iterate([], &[&1]) |> Enum.take(5)

# fn state -> { state_value, new_value } end
Stream.unfold({0,1}, fn {f1,f2} -> {f1, {f2, f1+f2}} end) |> Enum.take(15)

# Perform unfold on real resources
# * First argument a fn returning the value instead of value - need to listen for a while
# * Need to close the stream
# * Third argument takes the function to apply to the final accumulator value
Stream.resource(
  fn -> File.open!("README.md") end,
  fn file ->
    case IO.read(file, :line) do
    data when is_binary(data) -> {[data], file}
    _ -> {:halt, file}
    end
  end,
  fn file -> File.close(file) end
)
```

```exs
# iex enum/countdown.exs
counter = Countdown.timer
printer = counter |> Stream.each(&IO.puts/1)
speaker = printer |> Stream.each(&Countdown.say/1)
speaker |> Enum.take(60)
```

### Streams in Practice

Use streams to defer processing until the data is needed

## The Collectable Protocol

`Collectable` is the opposite of `Enum`: build collections inserting elements.

```exs
Enum.into 1..5, []
Enum.into 1..5, [ 100, 101 ]
Enum.into IO.stream(:stdio, :line), IO.stream(:stdio, :line)
```

## Comprehensions

```exs
for x <- [1, 2, 3, 4], do: x * x
for x <- [1, 2, 3, 4], x < 4, do: x * x
for x <- [1, 2], y <- [3, 4], do: x * y
for x <- [1, 2], y <- [3, 4], do: {x, y}

min_maxes = [{1, 4}, {2, 3}, {10, 15}]
for {min, max} <- min_maxes, n <- min..max, do: n

first8 = [1, 2, 3, 4, 5, 6, 7, 8]
for x <- first8, y <- first8, x >= y, rem(x*y, 10) == 0, do: {x, y} 
```

### Comprehensions Work on Bits, Too

```exs
for << ch <- "hello" >>, do: ch
for << ch <- "hello" >>, do: <<ch>>
for << << b1::size(2), b2::size(3), b3::size(3) >> <- "hello" >>, do: "0#{b1}#{b2}#{b3}"
```

### Scoping and Comprehensions

```exs
name = "Dave"
for name <- [ "cat", "dog" ], do: String.upcase(name)
name
```

### The Value Returned by a Comprehension

```exs
for x <- ~w{ cat dog }, into: %{}, do: { x, String.upcase(x) }
for x <- ~w{ cat dog }, into: Map.new, do: { x, String.upcase(x) }
for x <- ~w{ cat dog }, into: %{"ant" => "ANT"}, do: { x, String.upcase(x) }
for x <- ~w{ cat dog }, into: IO.stream(:stdio,:line), do: "<<#{x}>>\n"
```
