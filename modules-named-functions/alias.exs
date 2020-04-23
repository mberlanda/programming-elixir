defmodule My do
  defmodule Other do
    defmodule Module do
      defmodule Parser do
        def parse(str) do
          {n, _} = Integer.parse(str)
          n
        end
      end
      defmodule Runner do
        def execute(int), do: int * int
      end
    end
  end
end

defmodule Example do
  def run(s) do
    alias My.Other.Module.{Parser, Runner}
    s |> Parser.parse() |> Runner.execute()
  end
end

IO.puts Example.run("123")
IO.puts Example.run("4")
