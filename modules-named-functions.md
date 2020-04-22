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

## The Function's Body Is a Block

Exercise 2
```exs
$ iex times.exs
iex(1)> Times.triple(2)
6
iex(2)> Times.quadruple(2)
8

$ iex
iex(1)> c "times.exs"
[Times]
iex(2)> Times.quadruple(2)
8
```

## Function Calls and Pattern Matching

```exs
iex(1)> c "factorial1.exs"
[Factorial]
iex(2)> Factorial.of(5)
120
iex(3)> c "factorial1-bad.exs"
warning: this clause cannot match because a previous clause at line 2 always matches
  factorial1-bad.exs:3

[BadFactorial]
```

```exs
defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n-1)
end
```

Similar implementations can be adopted for sum of the first n
numbers or length of a list.

```exs
iex(1)> c "ex4.exs"
[Ex4]
iex(2)> Ex4.sum(5)
15
iex(3)> c "ex5.exs"
[Ex5]
iex(4)> Ex5.gcd(6,9)
3
iex(5)> Ex5.gcd(6,12)
6
iex(6)> Ex5.gcd(6,15)
3
```
