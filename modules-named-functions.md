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

## Guard Clauses

```exs
iex(1)> c "guard.exs"
[Guard]
iex(2)> Guard.what_is(99)
99 is a number
:ok
iex(3)> Guard.what_is([1,2,3])
[1, 2, 3] is a list
:ok
iex(4)> Guard.what_is(:abc)   
abc is an atom
:ok
iex(5)> c "factorial2.exs"
[Factorial]
iex(6)> Factorial.of(-10)
** (FunctionClauseError) no function clause matching in Factorial.of/1    
    
    The following arguments were given to Factorial.of/1:
    
        # 1
        -10
    
    factorial2.exs:2: Factorial.of/1
iex(6)> Factorial.of(10) 
3628800

```

### Guard-Clause Limitations

* Comparison operators: `==`, `!=`, `===`, `!==`, `>`, `<`, `<=`, `>=`
* Boolean operators: `or`, `and`, `not`, `!` (`||` and `&&` are not allowed)
* Join operators: `<>`, `++`
* The `in` operator
* Type-check functions: built-in Erlang functions such as `is_atom`, `is_binary` etc.
* Other functions: built-in functions and custom guards

<https://hexdocs.pm/elixir/guards.html>

## Default Parameters

```exs
iex(1)> c "default_params.exs"
[Example]
iex(2)> Example.func("a", "b")
["a", 2, 3, "b"]
["a", 2, 3, "b"]
iex(3)> Example.func("a", "b", "c")
["a", "b", 3, "c"]
["a", "b", 3, "c"]
iex(4)> Example.func("a", "b", "c", "d")
["a", "b", "c", "d"]
["a", "b", "c", "d"]
iex(5)> c "default_params1.exs"
warning: variable "p1" is unused (if the variable is not meant to be used, prefix it with an underscore)
  default_params1.exs:6: DefaultParams1.func/2

warning: this clause cannot match because a previous clause at line 2 always matches
  default_params1.exs:6

iex(1)> c "default_params2.exs"
[Params]
iex(2)> Params.func(99)
"You passed in 99 and 123"
iex(3)> Params.func(99, "cat")
"You passed in 99 and cat"
iex(4)> Params.func([99])     
"You said 123 with a list"
iex(5)> Params.func([99], "cat")
"You said cat with a list"

iex(9)> c "ex6.exs"
[Chop]
iex(10)> Chop.guess(273,1..1000)
Is it 500
Is it 250
Is it 375
Is it 312
Is it 281
Is it 265
273
:ok
```

## The Amazing Pipe Operator: |>

```exs
(1..10)
|> Enum.map(&(&1*&1))
|> Enum.filter(&(&1 < 40))
```

## Modules

Three directive for modules:

* `import Module, [, only:|except:]`, providing `name: :arity`
* `alias My.Other.Module.Parser, as: Parser` which can be abbreviated to something like `alias My.Other.Module.{Parser,Runner}`
* `require`, which will be illustrated in another chapter

## Module Attributes

These attributes have the `@` syntax and should be used for configuration and metadata only.
