defmodule Aoc2022.Day05 do
  def parse_instructions(line) do
    words = line |> String.split() |> Enum.drop(1) |> Enum.take_every(2)
    words |> Enum.map(&Integer.parse/1) |> Enum.map(fn n -> elem(n, 0) end)
  end

  def transpose_crates(crates) do
    crates
    |> Enum.reduce(fn el, acc ->
      Enum.zip(acc, el) |> Enum.map(&Tuple.to_list/1)
    end)
    |> Enum.map(&List.to_string/1)
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_charlist/1)
  end

  def execute_instruction(instruction, crates) do
    case instruction do
      [0, _from, _to] ->
        crates

      [n, from, to] ->
        crates =
          Enum.with_index(crates)
          |> Enum.map(fn {el, idx} ->
            idx = idx + 1

            cond do
              idx == to ->
                moved = Enum.take(Enum.at(crates, from - 1), n)
                moved ++ el

              # moved = List.first(Enum.at(crates, from - 1))
              # [moved | el]

              idx == from ->
                Enum.drop(el, n)

              # Enum.drop(el, 1)

              true ->
                el
            end
          end)

        crates
        # execute_instruction([n - 1, from, to], crates)
    end
  end

  def solve(input) do
    lines = String.trim_trailing(input) |> String.split("\n")
    parts = lines |> Enum.chunk_by(fn l -> l == "" end)
    IO.inspect(parts)

    crates =
      parts
      |> List.first()
      |> Enum.drop(-1)
      |> Enum.map(&String.to_charlist/1)
      |> Enum.map(fn el -> Enum.chunk_every(el, 4) end)
      |> Enum.map(fn el -> el |> Enum.map(fn el2 -> Enum.at(el2, 1) end) end)

    instructions = List.last(parts) |> Enum.map(&parse_instructions/1)
    IO.inspect(instructions)
    crates = transpose_crates(crates)
    IO.inspect(crates)
    moved = instructions |> List.foldl(crates, &execute_instruction/2)
    IO.inspect(moved)
    tops = moved |> Enum.map(&List.first/1) |> List.to_string()

    IO.inspect(tops)
  end
end
