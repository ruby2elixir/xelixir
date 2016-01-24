defmodule Squares do
  @moduledoc """
  Calculate sum of squares, square of sums, difference between two sums from 1 to a given end number.
  """

  @doc """
  Calculate sum of squares from 1 to a given end number.
  """
  @spec sum_of_squares(pos_integer) :: pos_integer
  def sum_of_squares(number),       do: sum_of_squares(number, 0)
  def sum_of_squares(0, acc),       do: acc
  def sum_of_squares(number, acc),  do: sum_of_squares(number-1, acc + (number*number))


  @doc """
  Calculate square of sums from 1 to a given end number.
  """
  @spec square_of_sums(pos_integer) :: pos_integer
  def square_of_sums(number),       do: square_of_sums(number, 0)
  def square_of_sums(0, acc),       do: acc * acc
  def square_of_sums(number, acc),  do: square_of_sums(number-1, acc + number)

  @doc """
  Calculate difference between sum of squares and square of sums from 1 to a given end number.
  """
  @spec difference(pos_integer) :: pos_integer
  def difference(number) do
    square_of_sums(number) - sum_of_squares(number)
  end
end
