defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.with_index(candidates)
      |> Enum.filter( fn({el, idx})-> not is_equal(base, el) end)
      |> Enum.filter( fn({el, idx})-> is_anagram(base, el) end)
      |> Enum.map( fn({el, idx})-> el end )
  end

  def sort_chars(str) do
    str
      |> String.downcase
      |> String.to_char_list
      |> Enum.sort
      |> List.to_string
  end

  def is_equal(base, candidate) do
    normalize(base) == normalize(candidate)
  end

  def is_anagram(base, candidate) do
    sort_chars(base) == sort_chars(candidate)
  end

  def normalize(str) do
    str |> String.downcase
  end
end
