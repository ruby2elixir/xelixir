defmodule Mapping do
  def mapping do
    map = add_alphabet()
    map = add_numbers(map)
  end

  def alphabet do
    (?a..?z )|> Enum.map( fn(x)-> List.to_string([x]) end )
  end

  def add_alphabet() do
    rev    = alphabet |> Enum.reverse
    zipped = List.zip([rev, alphabet])
    map    = for {key, val} <- zipped, into: %{}, do: {key, val}
  end

  def add_numbers(map) do
    numbers     = (0..9)|> Enum.map( fn(x)-> Integer.to_string(x) end )
    numbers_map = for x <- numbers, into: %{}, do: {x, x}
    Map.merge(map, numbers_map)
  end
end

defmodule Atbash do
  @doc """
  we have following rules:
  - it maps consistently to chars
  - chars map to their mirror char (a -> z, b -> y, etc.)
  - digits map to themselves
  - spaces + word boundary chars are ignored
  - the result is split up into groups of 5 chars
  """

  # @chars %{
  #   "a" => "z",
  #   "z" => "a",
  #   "b" => "y",
  #   "y" => "b",
  #   "1" => "1",
  # }

  @chars Mapping.mapping

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    plaintext
    |> String.graphemes
    |> Enum.map(fn(x)-> @chars[String.downcase(x)] end)
    |> Enum.filter(fn(x)-> x != nil end)
    |> Splitter.split_in_5
    |> Enum.map(fn(gr)-> Enum.join(gr) end)
    |> Enum.join(" ")
  end
end

defmodule Splitter do
  def split_in_5(list) do
    split_in_5(list, []) |> Enum.reverse
  end

  def split_in_5([a,b,c,d,e|[]], res) do
    [[a,b,c,d,e] | res ]
  end

  def split_in_5([a,b,c,d,e|t], res) do
    res = [[a,b,c,d,e] | res ]
    split_in_5(t, res)
  end

  def split_in_5(h, res) do
    [h | res ]
  end
end
