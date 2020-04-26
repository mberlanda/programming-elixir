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
