defmodule BasicBench do
  use Benchfella

  #Code.load_file("etl.exs", "etl")
  Code.load_file("example.exs", "etl")

  @old %{
      1 =>  ~W(A E I O U L N R S T),
      2 =>  ~W(D G),
      3 =>  ~W(B C M P),
      4 =>  ~W(F H V W Y),
      5 =>  ~W(K),
      8 =>  ~W(J X),
      10 => ~W(Q Z)
    }

  bench "ETL transform" do
    ETL.transform(@old)
  end
end


## my impl
#ETL transform      100000   21.59 µs/op

## Example
# ETL transform      100000   13.56 µs/op
