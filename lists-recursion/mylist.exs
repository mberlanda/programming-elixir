defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]) when is_number(head), do: [head * head | square(tail)]

  def add_1([]), do: []
  def add_1([head | tail]) when is_number(head), do: [head + 1 | square(tail)]

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]
end
