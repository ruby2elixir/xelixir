defmodule Bob do
  def hey(input) do
    cond do
        silence?(input)  -> "Fine. Be that way!"
        shouting?(input) -> "Whoa, chill out!"
        question?(input) -> "Sure."
        true ->  "Whatever."
    end
  end

  def shouting?(str) do
    (String.upcase(str) == str) && letters?(str)
  end

  def question?(str) do
    String.at(str, -1) == "?"
  end

  def silence?(str) do
    String.strip(str) == ""
  end

  defp letters?(input),  do: Regex.match?(~r/\p{L}+/, input)
end
