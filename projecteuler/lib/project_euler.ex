defmodule ProjectEuler do
  @moduledoc """
  Documentation for `ProjectEuler`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ProjectEuler.hello()
      :world

  """
  def solve do
    IO.puts("Hello PE World!")

    file_contents = File.read("0042_words.txt") |> elem(1)
    IO.puts("Obtained a string of length #{file_contents |> String.length}")

    word_list = file_contents |> String.replace("\"", "") |> String.split(",")
    short_word_list = word_list |> Enum.take(4)

    #Test methods
    short_word_list |>
      Enum.map(fn word ->
        IO.puts(word)
        IO.puts(word |> TriangleNumber.word_to_number)
        IO.puts(word |> TriangleNumber.word_to_number |> TriangleNumber.is_triangle_number)
      end
      )

    # triangle_word_list = word_list
    #  |> Enum.filter(&TriangleNumber/1)

    # IO.puts(triangle_word_list |> Enum.count)

  end
end

defmodule TriangleNumber do
  def word_to_number(word) do
    alphabet_zero = ?a - 1
    word |> String.downcase
    |> String.to_charlist
    |> Enum.map(fn f -> f - alphabet_zero end)
    |> Enum.sum
  end

  def triangle_number(n) do
    n*(n+1)/2
  end

  def is_triangle_number(n) do
    is_triangle_number(n, 1)
  end

  def is_triangle_number(n, index) do
    index_triangle_num = triangle_number(index)
    if index_triangle_num > n do
      false
    else
      if index_triangle_num == n do
        true
      else
        is_triangle_number(n, index+1)
      end
    end
  end
end
