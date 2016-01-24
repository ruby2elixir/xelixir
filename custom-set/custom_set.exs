defmodule CustomSet do
  # This lets the compiler check that all Set callback functions have been
  # implemented.
  @behaviour Set
  defstruct list: []


  def new(list),  do: %CustomSet{list: (list|>normalize_list)}
  def new(),      do: %CustomSet{}

  def delete(set, el) do
    set.list
      |> List.delete(el)
      |> new
  end

  def difference(set1, set2), do:
    new(set1.list -- set2.list)

  def disjoint?(set1, set2),  do:
    (set1.list -- set2.list == set1.list) && (set2.list -- set1.list == set2.list)

  def equal?(set1, set2), do:
    set1.list == set2.list

  def empty(_set), do: new

  def intersection(set1, set2) do
    a = set1.list
    b = set2.list
    res = (((a ++ b )  |> normalize_list )  -- (a -- b)) -- ( b -- a)
    new(res)
  end

  def member?(set, el), do:
    Enum.member?(set.list, el)

  def put(set, el), do:
    new([el|set.list])

  def size(set), do:
    Enum.count(set.list)

  def subset?(set1, set2) do
    a = set1.list
    b = set2.list

    ((a -- b) == []) && ((b -- a) ++ a)|>normalize_list == b
  end

  def to_list(set), do: set.list

  def union(set1, set2), do:
    new(set1.list ++ set2.list)

  defp normalize_list(list), do: list |> Enum.sort |> Enum.uniq
end
