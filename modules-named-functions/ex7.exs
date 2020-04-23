# Convert a float to a string with two decimal digits (Erlang)
:io.format("~.2f~n", [12345.23456])
:io_lib.format("~.2f~n", [12345.23456])
:erlang.float_to_binary(12345.23456, decimals: 2)

# Get the value of an operating-system environment variable (Elixir)
# System.get_env(varname, default \\ nil)
IO.puts(System.get_env("USERNAME"))

# Return the extension component of a file name (Elixir)
IO.puts(Path.extname("dave/test.exs") == ".exs")

# Return the process current working directory (Elixir)
# warning: System.cwd/0 is deprecated. Use File.cwd/0 instead
{_, cwd} = File.cwd()
IO.puts(cwd)

# Convert a string containing JSON into ELixir data structures
# Jason.decode!(~s({"age":44,"name":"Steve Irwin","nationality":"Australian"}))

# Execute a command in your operating system's shell
{result, code} = System.cmd("ls", ["-lah"])
