defmodule Aoc2022.Day03 do
  def find_common(s1, s2) do
    IO.inspect(s1)
    IO.inspect(s2)
    s1 = String.to_charlist(s1)
    s2 = String.to_charlist(s2)

    s1 |> Enum.filter(fn char -> Enum.member?(s2, char) end) |> Enum.uniq() |> List.to_string()
  end

  def get_priority(char) do
    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    idx = chars |> String.split(char) |> List.first() |> String.length()
    # idx = chars |> String.to_charlist() |> Enum.find_index(fn c -> c == char end)
    idx + 1
  end

  def solve(input) do
    lines = input |> String.split()
    pairs = lines |> Enum.map(fn line -> String.split_at(line, div(String.length(line), 2)) end)

    prios =
      pairs
      |> IO.inspect()
      |> Enum.map(fn {s1, s2} -> find_common(s1, s2) end)
      |> IO.inspect()
      |> Enum.map(fn c -> get_priority(c) end)
      |> IO.inspect()

    IO.puts(Enum.sum(prios))
  end
end
