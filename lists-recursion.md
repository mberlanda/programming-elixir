# ch07 Lists and Recursion

## Heads and Tails

```exs
iex(1)> [3|[]]
[3]
iex(2)> [2|[3|[]]]
[2, 3]
iex(3)> [1|[2|[3|[]]]]
[1, 2, 3]
iex(4)> [a,b,c] = [1,2,3]
[1, 2, 3]
iex(5)> a
1
iex(6)> b
2
iex(7)> c
3
iex(8)> [head|tail] = [1,2,3]
[1, 2, 3]
iex(9)> head
1
iex(10)> tail
[2, 3]
```

## Using Head and Tail to Process a List

```exs
iex(1)> c "lists-recursion/mylist.exs"
[MyList]
iex(2)> MyList.len([1,2,3])
3
```

## Using Head and Tail to Build a List

```exs
iex(3)> MyList.square([])
[]
iex(4)> MyList.square([1, 2.3, 5])
[1, 5.289999999999999, 25]
iex(5)> MyList.add_1([1, 2.3, 5]) 
[2, 5.289999999999999, 25]
```

## Creating a Map Function

```exs
iex(7)> MyList.map([1,2,3,4], fn (n) -> n*n end)
[1, 4, 9, 16]
```