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

## Pattern Matching and Updating Maps

```exs
$ elixir maps/query.exs 
[%{height: 1.88, name: "Dave"}, %{height: 2.16, name: "Shaquille"}]
iex(3)> c "maps/book_room.exs"
[HotelRoom]
iex(4)> people |> Enum.each(&HotelRoom.book/1)
Need low shower controls for Grumpy
Need regular bed for Dave
Need regular bed for Dopey
Need extra long bed for Shaquille
Need low shower controls for Sneezy
:ok
```

### Pattern Matching Can't Bind Keys

```exs
%{2 => state } = %{ 1 => :ok, 2 => :error } # OK
%{item => :ok } = %{ 1 => :ok, 2 => :error } # Not OK
```

### Pattern Matching Can Match Variable Keys

```exs
data = %{ name: "Dave", state: "TX", likes: "Elixir" }
for key <- [ :name, :likes ] do
    %{ ^key => value } = data
    value
end
```

## Updating a Map

```exs
# Simplest way
new_map = %{ old_map | key => value, ...}
# This does not add a new keys
Map.put_new/3
```

## Structs

```exs
# c "maps/defstruct.exs"
s1 = %Subscriber{}
s2 = %Subscriber{ name: "Dave" }
s3 = %Subscriber{ name: "Mary", paid: true }
s3.name
%Subscriber{name: a_name} = s3
a_name
s4 = %Subscriber{ s3 | name: "Marie"}
```

```exs
a1 = %Attendee{name: "Dave", over_18: true}
Attendee.may_attend_after_party(a1)
a2 = %Attendee{a1 | paid: true}
Attendee.may_attend_after_party(a2)
Attendee.print_vip_badge(a2)
a3 = %Attendee{}
Attendee.print_vip_badge(a3)
```

## Nested Dictionary Structures

```exs
report = %BugReport{
  owner: %Customer{name: "Dave", company: "Pragmatic"},
  details: "broken"
}
report.owner.company
put_in(report.owner.company, "PragProg")
# this macro is translated to
report = %BugReport{
  report | owner: %Customer{report.owner | company: "PragProg"}
}
# macro applying a function
update_in(report.owner.name, &("Mr. " <> &1))
```

### Nested Accessors and Nonstructs

```exs
report = %{ owner: %{ name: "Dave", company: "Pragmatic" }, severity: 1}
put_in(report[:owner][:company], "PragProg")
update_in(report[:owner][:name], &("Mr. " <> &1))
```

### Dynamic (Runtime) Nested Accessors

| | Macro | Function |
|-|-------|----------|
|`get_in`| no | (dict, keys)
|`put_in`| (path, value) | (dict, keys, value)
|`update_in`| (path, fn) | (dict, keys, fn)
|`get_and_update_in`| (path, fn) | (dict, keys, fn)

### The Access Module

<https://hexdocs.pm/elixir/1.10.2/Access.html#summary>

## Sets

```exs
set1 = 1..5 |> Enum.into(MapSet.new())
set2 = 3..8 |> Enum.into(MapSet.new())
MapSet.member?(set1, 3)
MapSet.union(set1, set2)
MapSet.difference(set1, set2)
MapSet.difference(set2, set1)
MapSet.intersection(set2, set1)
```

## With Great Power Comes Great Temptation

Don't use the Struct in an object-oriented way in order
to avoid mixing paradigms.
