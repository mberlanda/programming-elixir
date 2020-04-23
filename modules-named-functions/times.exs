defmodule Times do
  def double(n) do
    n * 2
  end

  # Exercise 1
  def triple(n), do: n * 3
  # Exercise 3
  def quadruple(n), do: double(n) |> double
end
