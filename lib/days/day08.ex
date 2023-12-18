defmodule Aoc2022.Day08 do
  def can_see_tree({row, col}, trees) do
    width = trees |> List.first() |> Enum.count()
    height = trees |> Enum.count()
    tree = trees |> Enum.at(row) |> Enum.at(col)
    vision_blocked = fn l -> Enum.any?(l, fn n -> n >= tree end) end
    range_to_row = fn r -> trees |> Enum.at(r) |> Enum.at(col) end
    range_to_col = fn c -> trees |> Enum.at(row) |> Enum.at(c) end
    IO.inspect({row, col})
    row_before = 0..(row - 1) |> Enum.map(range_to_row)
    row_after = (row + 1)..(height - 1) |> Enum.map(range_to_row)
    col_before = 0..(col - 1) |> Enum.map(range_to_col)
    col_after = (col + 1)..(width - 1) |> Enum.map(range_to_col)
    IO.inspect(!([row_before, row_after, col_before, col_after] |> Enum.all?(vision_blocked)))
  end

  def row_to_trees(row) do
    IO.inspect(row)

    row
    |> String.to_charlist()
    |> IO.inspect()
    |> Enum.map(fn n -> n |> List.wrap() |> List.to_integer() end)
  end

  def solve(input) do
    lines = String.split(input)
    trees = Enum.map(lines, &row_to_trees/1)
    IO.inspect(trees)
    width = trees |> List.first() |> Enum.count()
    height = trees |> Enum.count()
    coords = for row <- 1..(height - 2), col <- 1..(width - 2), do: {row, col}

    visible =
      IO.inspect(coords |> Enum.filter(fn c -> can_see_tree(c, trees) end) |> Enum.count())

    IO.inspect(visible + (2 * width + 2 * height - 4))
  end
end
