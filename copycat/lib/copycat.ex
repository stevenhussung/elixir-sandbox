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

    file_contents = File.read("flightsToLAX.json")
      |> elem(1) #Just the contents
      |> Jason.decode
      |> elem(1)

    flights = file_contents["flights"]
    first_flight = hd(flights)

    IO.puts(Enum.map(flights, fn f -> FlightPrinter.flight_to_string((f)) end))

    MapHandler.printMap(first_flight)

  end
end

defmodule FlightPrinter do
  def flight_to_string(flight) do
    flight["airlineName"] <> " flight " <> flight["flightCode"] <>
    " from " <> flight["origination"] <> " to " <> flight["destination"] <>
    " on board this " <> flight["planeType"] <> "\n"
  end
end

defmodule MapHandler do
  def printMap(m) do
    #Enum.each(m, fn {k, v} -> keyValuePrinter({k, v}) end)
    Enum.each(m, &keyValuePrinter/1)
  end

  def keyValuePrinter({k, v}) do
    IO.puts("#{k} => #{v}")
  end
end

defmodule FirstLetter do
  def capitalize(s) do
    s |> String.split
    |> Enum.map(fn s -> String.capitalize(s) end)
    |> Enum.join(" ")
  end
end
