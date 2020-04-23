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

## Maps

```exs
map = %{ name: "Dave", likes: "Programming", where: "Dallas" }
Map.keys(map) # [:likes, :name, :where]
Map.values(map) # ["Programming", "Dave", "Dallas"]
map[:name] # "Dave"
map.name # "Dave"
map1 = Map.drop(map, [:where, :likes])
map2 = Map.put(map, :also_likes, "Ruby")
Map.has_key?(map1, :where)
{ value, updated_map } = Map.pop(map2, :also_likes)
Map.equal?(map, updated_map)
```
