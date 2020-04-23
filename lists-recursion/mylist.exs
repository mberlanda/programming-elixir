defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]) when is_number(head), do: [head * head | square(tail)]

  def add_1([]), do: []
  def add_1([head | tail]) when is_number(head), do: [head + 1 | square(tail)]

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def reduce([], value, _fun), do: value
  def reduce([head | tail], value, fun), do: reduce(tail, fun.(head, value), fun)

  # Exercise 1
  def mapsum([], _fun), do: 0
  def mapsum([head | tail], fun), do: fun.(head) + mapsum(tail, fun)

  # Exercise 2
  def max([x | []]), do: x
  def max([a | [b | tail]]) when a > b, do: max([a | tail])
  def max([_a | [b | tail]]), do: max([b | tail])

  # Exercise 3
  def caesar([], _num), do: []
  def caesar([head | tail], num) when head + num < ?z, do: [head + num | caesar(tail, num)]
  def caesar([_head | tail], num), do: ['?' | caesar(tail, num)]
end
