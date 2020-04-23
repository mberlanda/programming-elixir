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

## Reducing a List to a Single Value

```exs
iex(7)> MyList.reduce([1,2,3,4], 0, &(&1+&2))
10
# Exercise 1
iex(8)> MyList.mapsum [1,2,3], &(&1*&1)
14
# Exercise 2
iex(10)> MyList.max([5,7,1,-4])
7
iex(11)> MyList.max([5,7])     
7
iex(12)> MyList.max([-4]) 
-4
iex(13)> MyList.max([])  
** (FunctionClauseError) no function clause matching in MyList.max/1    
    
    The following arguments were given to MyList.max/1:
    
        # 1
        []
    
    lists-recursion/mylist.exs:22: MyList.max/1
# Exercise 3
iex(32)> MyList.caesar('ryvkve', 13)
['?', '?', '?', 120, '?', 114]
iex(33)> IO.puts MyList.caesar('ryvkve', 13)
???x?r
```

## More Complex List Patterns

```exs
iex(1)> c "lists-recursion/swap.exs"
[Swapper]
iex(2)> Swapper.swap([])
[]
iex(3)> Swapper.swap([1,2,3,4])
[2, 1, 4, 3]
iex(4)> Swapper.swap([1,2,3])  
** (RuntimeError) Cannot swap a list with an odd number of elements
    lists-recursion/swap.exs:4: Swapper.swap/1
    lists-recursion/swap.exs:3: Swapper.swap/1
```

### List of Lists

```exs
iex(1)> c "lists-recursion/weather.exs"
[WeatherHistory]
iex(2)> import WeatherHistory
WeatherHistory
iex(3)> for_location_27(test_data)
[[123456, 27, 15, 0.45], [234561, 27, 18, 0.645]] 
# Excercise 4
iex(1)> c "lists-recursion/mylist.exs"
[MyList]
iex(2)> MyList.span(4,3)
[]
iex(3)> MyList.span(3,3)
[3]
iex(4)> MyList.span(3,7)
[3, 4, 5, 6, 7]
```

## The List Module in Action

```exs
[1,2,3] ++ [4,5,6] # Concatenate
List.flatten([1,2,[3[4,5]],[6]])
List.foldl([1,2,3],"", fn value, acc -> "#{value}(#{acc})" end) # 3(2(1()))
List.foldr([1,2,3],"", fn value, acc -> "#{value}(#{acc})" end) # 1(2(3()))
list = [ 1, 2, 3 ]
List.replace_at(list, 2, "buckle my shoe")
kw = [{:name, "Dave"}, {:likes, "Programming"}, {:where, "Dallas", "TX"}]
List.keyfind(kw, "TX", 2)
List.keyfind(kw, "TX", 1, "No city called TX")
kw = List.keydelete(kw, "TX", 2)
kw = List.keyreplace(kw, :name, 0, {:first_name, "Dave"})
```