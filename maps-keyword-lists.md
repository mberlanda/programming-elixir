# ch08 Maps, Keyword Lists, Sets, and Structs

## How to Choose Between Maps and Keyword Lists

In case you need to store more than one value per key and/or
a guaranteed element order, you may use `Keyword` module
In any other cases, you should use a `map`.

## Keyword Lists

```exs
iex(1)> c "maps/keywords.exs"
[Canvas]
iex(2)> Canvas.draw_text("hello", fg: "red", style: "italic", style: "bold")
Drawing text "hello"
Foreground: red
Background: white
Font: Merriweather
Pattern: solid
Style: ["italic", "bold"]
:ok
```