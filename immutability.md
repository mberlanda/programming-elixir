# Immutability

```exs
iex(1)> list1 = [1, 2, 3]
[1, 2, 3]
iex(2)> list2 = [4 | list1]
[4, 1, 2, 3]
iex(3)> name = "elixir"
"elixir"
iex(4)> cap_name = String.capitalize name
"Elixir"
iex(5)> name
"elixir"
```