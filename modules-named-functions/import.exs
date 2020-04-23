defmodule Example do
  def func1 do
    List.flatten([1, [2, 3], 4])
  end

  def func2 do
    import List, only: [flatten: 1]
    flatten([1, [2, 3], 4])
  end
end
