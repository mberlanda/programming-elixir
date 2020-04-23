defmodule DefaultParams1 do
  def func(p1, p2) do
    IO.inspect([p1, p2])
  end

  def func(p1, 99) do
    IO.puts("you said 99")
  end
end

# warning: variable "p1" is unused (if the variable is not meant to be used, prefix it with an underscore)
#   default_params1.exs:6: DefaultParams1.func/2
# warning: this clause cannot match because a previous clause at line 2 always matches
#   default_params1.exs:6
