# ch09 An Aside—What Are Types?

Primitive type list vs `List` module.
`Keyword` module implementation is based on a list of tuples.

```exs
options = [ {:width, 72}, {:style, "light"}, {:style, "print"} ]
List.last options
Keyword.get_values options, :style
```
