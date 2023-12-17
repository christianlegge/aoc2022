defmodule Aoc2022.Day02 do
  # def get_score(["A", "X"]), do: 4
  # def get_score(["B", "X"]), do: 1
  # def get_score(["C", "X"]), do: 7
  # def get_score(["A", "Y"]), do: 8
  # def get_score(["B", "Y"]), do: 5
  # def get_score(["C", "Y"]), do: 2
  # def get_score(["A", "Z"]), do: 3
  # def get_score(["B", "Z"]), do: 9
  # def get_score(["C", "Z"]), do: 6

  def solve(input) do
    get_score = fn
      ["A", "X"] -> 4
      ["B", "X"] -> 1
      ["C", "X"] -> 7
      ["A", "Y"] -> 8
      ["B", "Y"] -> 5
      ["C", "Y"] -> 2
      ["A", "Z"] -> 3
      ["B", "Z"] -> 9
      ["C", "Z"] -> 6
    end

    get_score_2 = fn
      ["A", "X"] -> 3
      ["A", "Y"] -> 4
      ["A", "Z"] -> 8
      ["B", "X"] -> 1
      ["B", "Y"] -> 5
      ["B", "Z"] -> 9
      ["C", "X"] -> 2
      ["C", "Y"] -> 6
      ["C", "Z"] -> 7
    end

    lines = String.split(input, "\n")
    # Enum.each(lines, fn line -> IO.puts(line) end)

    scores =
      lines
      |> Enum.map(fn line -> String.split(line) end)
      |> Enum.filter(fn list -> Enum.count(list) == 2 end)
      |> Enum.map(fn inputs -> get_score_2.(inputs) end)

    IO.puts(Enum.sum(scores))
  end
end
