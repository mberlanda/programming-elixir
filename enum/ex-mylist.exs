defmodule MyList do
  def all?([], _func), do: true
  def all?([head | tail], func), do: func.(head) && all?(tail, func)

  def each([], _func), do: :ok

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _func), do: []

  def filter([head | tail], func) do
    if func.(head), do: [head | filter(tail, func)], else: filter(tail, func)
  end

  def split(list, idx) when idx >= 0, do: _split(list, idx, [])
  def split(list, idx) when idx < 0, do: _split(list, idx + length(list), [])

  defp _split([head | tail], idx, acc) when length(acc) < idx do
    _split(tail, idx, acc ++ [head])
  end

  defp _split(list, _idx, acc), do: {acc, list}

  def take([], _), do: []
  def take(list, 0), do: []
  def take([head | tail], idx) when idx > 0, do: [head | take(tail, idx - 1)]
end

ExUnit.start()

defmodule ExampleTest do
  use ExUnit.Case

  # import Enum
  # import ExUnit.CaptureIO

  # doctest MyList

  # ex. 6
  test "all?" do
    assert(MyList.all?([], &(&1 < 5)) == Enum.all?([], &(&1 < 5)))
    assert(MyList.all?([1, 2, 3], &(&1 < 5)) == Enum.all?([1, 2, 3], &(&1 < 5)))
    assert(MyList.all?([4, 5, 6], &(&1 < 5)) == Enum.all?([4, 5, 6], &(&1 < 5)))
  end

  test "each" do
    # func = fn s -> capture_io(IO.puts(s)) end
    func = fn s -> IO.puts(s) end

    assert(MyList.each([], func) == Enum.each([], func))
    assert(MyList.each([1], func) == Enum.each([1], func))
  end

  test "filter" do
    func = &(&1 < 5)

    assert(MyList.filter([], func) == Enum.filter([], func))
    assert(MyList.filter([1, 2, 3], func) == Enum.filter([1, 2, 3], func))
    assert(MyList.filter([4], func) == Enum.filter([4], func))
    assert(MyList.filter([12], func) == Enum.filter([12], func))
  end

  test "split" do
    assert(MyList.split([], 4) == Enum.split([], 4))
    assert(MyList.split([1], 0) == Enum.split([1], 0))
    assert(MyList.split([1], 1) == Enum.split([1], 1))
    assert(MyList.split([1, 2, 3], 1) == Enum.split([1, 2, 3], 1))
    assert(MyList.split([12, 1, 2, 25, 4], 3) == Enum.split([12, 1, 2, 25, 4], 3))
  end

  test "take" do
    assert(MyList.take([], 4) == Enum.take([], 4))

    assert(MyList.take([1], 0) == Enum.take([1], 0))
    assert(MyList.take([1], 1) == Enum.take([1], 1))
    assert(MyList.take([1], 4) == Enum.take([1], 1))

    assert(MyList.take([1, 2, 3], 1) == Enum.take([1, 2, 3], 1))
    assert(MyList.take([12, 1, 2, 25, 4], 3) == Enum.take([12, 1, 2, 25, 4], 3))
  end
end
