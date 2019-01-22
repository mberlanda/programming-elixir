# ch05 Anonymous Functions

Functions-1

```exs
iex(1)> list_concat = fn (a,b) -> a ++ b end
#Function<12.128620087/2 in :erl_eval.expr/5>
iex(2)> list_concat.([:a, :b], [:c, :d])
[:a, :b, :c, :d]
iex(3)> sum = fn (a,b,c) -> a + b + c end
#Function<18.128620087/3 in :erl_eval.expr/5>
iex(4)> sum.(1, 2, 3)
6
iex(5)> pair_tuple_to_list = fn {a, b} -> [a, b] end
#Function<6.128620087/1 in :erl_eval.expr/5>
iex(6)> pair_tuple_to_list.({1234, 5678})
[1234, 5678]
```

```
➜  programming_elixir git:(master) ✗ elixir functions/handle_open.exs
First line: # Programming Elixir

Error: no such file or directory
```

[Functions-2](functions/ex2.exs)
[Functions-3](functions/ex3.exs)

Function-4

```exs
iex(1)> prefix = fn (a) -> fn (b) -> "#{a} #{b}" end end
#Function<6.128620087/1 in :erl_eval.expr/5>
iex(2)> mrs = prefix.("Mrs")
#Function<6.128620087/1 in :erl_eval.expr/5>
iex(3)> mrs.("Smith")
"Mrs Smith"
iex(4)> prefix.("Elixir").("Rocks")
"Elixir Rocks"
```

The & Notation

```exs
add_one = &(&1 + 1)
square = &(&1 * &1)
speak = &(IO.puts(&1))
rnd = &(Float.round(&1, &2))
divrem = &{ div(&1,&2), rem(&1,&2) }
s = &"bacon and #{&1}"
match_end = &~r/.*#{&1}$/
```

Function-5

```exs
Enum.map [1,2,3,4], fn x -> x + 2 end
Enum.map (1..4), &(&1 +2)
Enum.map [1,2,3,4], fn x -> IO.inspect x end
Enum.map (1..4), &IO.inspect/1
```