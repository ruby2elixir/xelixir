defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    string
      |> list_of_digits
      |> from_bits_to_decimal
  end

  def from_bits_to_decimal(bit_list) do
    bit_list
    |> Enum.reverse
    |> Enum.with_index
    |> Enum.reduce(0, fn({presence, pow}, acc) -> presence * :math.pow(2, pow) + acc end )
  end

  def list_of_digits(num_bin) do
    cond do
      is_binary_number?(num_bin)
        -> num_bin |> String.graphemes |> Enum.map(&(String.to_integer(&1)))
      true
        -> [0]
    end
  end

  defp is_binary_number?(str) do
    Regex.match?(~r/^[01]+$/, str)
  end
end
