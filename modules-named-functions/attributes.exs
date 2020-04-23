defmodule Example do
  @author "Mauro"
  def get_author do
    @author
  end

  @attr "one"
  def first, do: @attr

  @attr "two"
  def second, do: @attr
end

IO.puts(Example.get_author())
IO.puts(Example.second())
IO.puts(Example.first())
