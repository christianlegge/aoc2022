defmodule Aoc2022.Day01 do
  def sum_strings(list) do
    list |> Enum.map(fn el -> Integer.parse(el) |> Kernel.elem(0) end) |> Enum.sum()
  end

  def solve(input) do
    lines = String.split(input, "\n")
    groups = Enum.chunk_by(lines, fn l -> l != "" end)
    IO.inspect(groups)
    sums = groups |> Enum.take_every(2) |> Enum.map(fn el -> sum_strings(el) end)

    IO.puts(Enum.max(sums))
    IO.puts(sums |> Enum.sort() |> Enum.reverse() |> Enum.take(3) |> Enum.sum())

    # for group <- Enum.take_every(groups, 2) do
    #   IO.inspect(group)
    #   IO.puts(sum_strings(group))
    #   IO.puts("new group")
    # end
  end
end
