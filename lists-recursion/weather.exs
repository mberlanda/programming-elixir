defmodule WeatherHistory do
  def for_location_27([]), do: []

  def for_location_27([[time, 27, temp, rain] | tail]) do
    [[time, 27, temp, rain] | for_location_27(tail)]
  end

  def for_location_27([_ | tail]), do: for_location_27(tail)

  def test_data do
    [
      [123_456, 26, 15, 0.125],
      [123_456, 27, 15, 0.45],
      [234_561, 27, 18, 0.645],
      [234_561, 28, 17, 0.725],
      [123_456, 26, 15, 0.443],
      [123_456, 28, 15, 0.822]
    ]
  end
end
