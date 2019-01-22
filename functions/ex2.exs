fizzbuzz = fn
  {0, 0, _} -> "FizzBuzz"
  {0, _, _} -> "Fizz"
  {_, 0, _} -> "Buzz"
  {_, _, x} -> x
end

IO.puts fizzbuzz.({0, 0, :a})
IO.puts fizzbuzz.({0, :a, :b})
IO.puts fizzbuzz.({:a, 0, :b})
IO.puts fizzbuzz.({:a, :b, :else})
