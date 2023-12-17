defmodule Aoc2022.Day04 do
  def get_ranges(line) do
    line
    |> String.split(",")
    |> Enum.flat_map(fn range -> String.split(range, "-") end)
    |> Enum.map(fn n -> Integer.parse(n) end)
    |> Enum.map(fn {n, _} -> n end)
  end

  def is_enclosing([a, b, c, d]) do
    (a <= c && b >= d) || (a >= c && b <= d)
  end

  def is_overlapping([a, b, c, d]) do
    !(b < c || d < a)
  end

  def solve(input) do
    lines = String.split(input)
    IO.inspect(lines)

    enclosing = lines |> Enum.map(&get_ranges/1) |> Enum.filter(&is_enclosing/1)
    overlapping = lines |> Enum.map(&get_ranges/1) |> Enum.filter(&is_overlapping/1)
    IO.inspect(Enum.count(enclosing))
    IO.inspect(Enum.count(overlapping))
  end
end
