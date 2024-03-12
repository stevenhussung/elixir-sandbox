defmodule Copycat do
  @moduledoc """
  Documentation for `Copycat`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Copycat.hello()
      :world

  ## Start info:

  To load into this, use "iex -S mix"
  """
  def hello do
    :world
    IO.puts("Hello in there, hello")

    File.read("flightsToLAX.json")
  end
end
