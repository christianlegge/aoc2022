defmodule Aoc2022.Day07 do
  def process_instructions(instrs, dirs, cwd) do
    if(instrs == []) do
      dirs
    else
      [instr | rest] = instrs

      # IO.inspect({instr, rest, dirs, cwd})

      cond do
        instr == nil ->
          dirs

        String.starts_with?(instr, "$ cd") ->
          next_dir = instr |> String.split() |> List.last()
          process_instructions(rest, dirs, next_dir)

        String.starts_with?(instr, "$ ls") ->
          {listing, rest} = Enum.split_while(rest, fn l -> !String.starts_with?(l, "$") end)
          listing = listing |> Enum.map(&String.split(&1))
          # IO.inspect({listing, rest})

          dir_contents =
            List.foldl(listing, %{}, fn [sizetype, name], acc ->
              Map.put(acc, name, sizetype)
            end)

          dirs = Map.merge(dirs, %{cwd => dir_contents})
          process_instructions(rest, dirs, cwd)
      end
    end
  end

  def get_parent_dir(cwd, dirs) do
  end

  def get_object_size({name, sizetype}, dirs) do
    case sizetype do
      "dir" -> get_dir_size(name, dirs)
      _ -> Integer.parse(sizetype) |> elem(0)
    end
  end

  def get_dir_size(dir, dirs) do
    contents = dirs[dir] |> Map.to_list()
    contents |> Enum.map(fn obj -> get_object_size(obj, dirs) end) |> Enum.sum()
  end

  def solve(input) do
    instrs = String.split(input, "\n")
    dirs = process_instructions(instrs, %{}, "/")
    IO.inspect(dirs)
    sizes = Map.keys(dirs) |> Enum.map(&get_dir_size(&1, dirs))
    IO.inspect(sizes |> Enum.filter(fn el -> el <= 100_000 end) |> Enum.sum())
  end
end
