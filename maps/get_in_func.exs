authors = [
  %{name: "José", language: "Elixir"},
  %{name: "Matz", language: "Ruby"},
  %{name: "Larry", language: "Perl"}
]

languages_with_an_r = fn :get, collection, next_fn ->
  for row <- collection do
    if String.contains?(row.language, "r") do
      next_fn.(row)
    end
  end
end

IO.inspect(get_in(authors, [languages_with_an_r, :name]))

to_uppercase = fn :get, collection, next_fn ->
  for row <- collection do
    next_fn.(update_in(row[:name], &String.upcase(&1)))
  end
end

IO.inspect(get_in(authors, [to_uppercase, :name]))
