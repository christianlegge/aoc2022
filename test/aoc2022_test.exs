defmodule Aoc2022Test do
  use ExUnit.Case
  doctest Aoc2022

  def run_day(day, test, module) do
    module.solve(test)

    with {:ok, contents} <- File.read("data/day#{day}.txt") do
      module.solve(contents)
    end
  end

  @tag :skip
  test "day 01" do
    run_day("01", "1000
2000
3000

4000

5000
6000

7000
8000
9000

10000", Aoc2022.Day01)
  end

  test "day 02" do
    run_day("02", "A Y
B X
C Z", Aoc2022.Day02)
  end
end
