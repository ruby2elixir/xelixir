defmodule Allergies do
  @allergies ~w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags) do
    List.zip([presence_bits(flags), @allergies])
      |> Enum.filter( fn(x)-> elem(x, 0) == 1 end )
      |> Enum.map( fn(x)-> elem(x, 1) end)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, item) do
    item in list(flags)
  end

  def presence_bits(flags) do
    Integer.digits(flags, 2) |> Enum.reverse
  end
end

