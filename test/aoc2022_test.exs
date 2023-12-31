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

  @tag :skip
  test "day 02" do
    run_day("02", "A Y
B X
C Z", Aoc2022.Day02)
  end

  @tag :skip
  test "day 03" do
    run_day("03", "vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw", Aoc2022.Day03)
  end

  @tag :skip
  test "day 04" do
    run_day("04", "2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8", Aoc2022.Day04)
  end

  @tag :skip
  test "day 05" do
    run_day("05", "    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2", Aoc2022.Day05)
  end

  @tag :skip
  test "day 06" do
    run_day("06", "mjqjpqmgbljsphdztnvjfqwrcgsmlb", Aoc2022.Day06)
  end

  @tag :skip
  test "day 07" do
    run_day("07", "$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k", Aoc2022.Day07)
  end

  test "day 08" do
    run_day("08", "30373
25512
65332
33549
35390", Aoc2022.Day08)
  end
end
