# ch06 Modules and Named Functions

## Compiling a Module

Using command line `iex`, it compiles and load in an interactive prompt. Within a `iex` session, the compilation can be done with the command `c`:

```exs
$ iex times.exs
Erlang/OTP 22 [erts-10.7.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe]

Interactive Elixir (1.10.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Times.double(4)
8
iex(2)> c "times.exs"          
warning: redefining module Times (current version defined in memory)
  times.exs:1

[Times]
iex(3)> Times.double("car")
** (ArithmeticError) bad argument in arithmetic expression: "car" * 2
    :erlang.*("car", 2)
    times.exs:3: Times.double/1
```

The identifier of a named function in Elixir are its name and arity.
