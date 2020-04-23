defmodule Chop do
  defguard is_valid(n, a, b) when is_integer(n) and n in a..b
  defguard is_greater(n, a, b) when div(a+b, 2) < n
  defguard is_lower(n, a, b) when div(a+b, 2) > n

  defp middle(a, b), do: div(a+b,2)
  def guess(n, low..high) when is_valid(n, low, high) and is_greater(n, low, high) do
    current = middle(low, high)
    IO.puts("Is it #{current}")
    guess(n, current..high)
  end

  def guess(n, low..high) when is_valid(n, low, high) and is_lower(n, low, high) do
    current = middle(low, high)
    IO.puts("Is it #{current}")
    guess(n, low..current)
  end

  def guess(n, low..high) when is_valid(n, low, high), do: IO.puts(n)
end
