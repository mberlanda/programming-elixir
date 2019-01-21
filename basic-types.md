# Elixir Basics

## Built-in Types

* Value types:
  * Arbitrary-sized integers: e.g `1234`, `0xcafe`, `0o765`, `0b1010`
  * Floating-point numbers: e.g. `1.0`
  * Atoms: e.g. `:abc`
  * Ranges: e.g. `1..10`
  * Regular expressions: e.g. `~r{regexp}opts` where opts are: `f` first line, `i` insensitive, `m` multiline, `s` , `U` ungreedy as little as possible, `u` unicode, `x` extended mode
* System types:
  * PIDs and ports: available calling `self`
  * References: `make_ref` function result
* Collection types:
  * Tuples: e.g. `{ 1, 2 }`, `{ :ok, 12, "next" }`
  * Lists
  * Maps: e.g. `%{ key => value, key => value }`
  * Binaries: e.g. `bin = << 1, 2 >>`, `<<3 :: size(2), 5 :: size(4), 1 :: size(2)>>`


## Variable scope

* [basic-types/back-blocks.exs](basic-types/back-blocks.exs)
* [basic-types/with-scope.exs](basic-types/with-scope.exs)
* [basic-types/with-match.exs](basic-types/with-match.exs)
