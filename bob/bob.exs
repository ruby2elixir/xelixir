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

  # http://erlang.org/doc/man/re.html  + Unicode character properties
  @doc """
    \p{xx}
    a character with the xx property
    \P{xx}
    a character without the xx property
    \X
    a Unicode extended grapheme cluster




    the following general category property codes are supported:

      C
      Other
      Cc
      Control
      Cf
      Format
      Cn
      Unassigned
      Co
      Private use
      Cs
      Surrogate
      L
      Letter
      Ll
      Lower case letter
      Lm
      Modifier letter
      Lo
      Other letter
      Lt
      Title case letter
      Lu
      Upper case letter
      M
      Mark
      Mc
      Spacing mark
      Me
      Enclosing mark
      Mn
      Non-spacing mark
      N
      Number
      Nd
      Decimal number
      Nl
      Letter number
      No
      Other number
      P
      Punctuation
      Pc
      Connector punctuation
      Pd
      Dash punctuation
      Pe
      Close punctuation
      Pf
      Final punctuation
      Pi
      Initial punctuation
      Po
      Other punctuation
      Ps
      Open punctuation
      S
      Symbol
      Sc
      Currency symbol
      Sk
      Modifier symbol
      Sm
      Mathematical symbol
      So
      Other symbol
      Z
      Separator
      Zl
      Line separator
      Zp
      Paragraph separator
      Zs
      Space separator
  """
  defp letters?(input),  do: Regex.match?(~r/\p{L}+/, input)
end
