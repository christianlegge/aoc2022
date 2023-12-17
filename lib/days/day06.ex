defmodule Aoc2022.Day06 do
  def are_distinct(chars) do
    uniques = Enum.uniq(chars)
    Enum.count(chars) == Enum.count(uniques)
  end

  def find_first_set({chars, n}) do
    if are_distinct(Enum.take(chars, 14)) do
      n
    else
      find_first_set({Enum.drop(chars, 1), n + 1})
    end
  end

  def solve(input) do
    IO.inspect(find_first_set({String.to_charlist(input), 14}))
  end
end
