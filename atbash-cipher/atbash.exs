defmodule Atbash do
  @doc """
  we have following properties:
  - it maps consistently to chars
  -
  """

  @chars %{
    "l" => "o",
    "o" => "l",

    "b" => "y",
    "y" => "b",

    "d" => "w",
    "w" => "d",

    "e" => "v",
    "v" => "e",

    "g" => "t",
    "t" => "g",

    "i" => "r",
    "r" => "i",

    "m" => "n",
    "n" => "m",

    "s" => "h",
    "h" => "s",


  }


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
    |> Splitter.split_in_5
    |> Enum.map(fn(gr)-> Enum.join(gr) end)
    |> Enum.join(" ")
  end
end

defmodule Splitter do
  def split_in_5(list) do
    split_in_5(list, [])
  end

  def split_in_5([a,b,c,d,e|t], res) do
    res = [[a,b,c,d,e] | res ]
    split_in_5(t, res)
  end

  def split_in_5(h, res) do
    [h | res ]
  end
end
Splitter.split_in_5([1,2,3,4,5,6,7,8,9,10])
