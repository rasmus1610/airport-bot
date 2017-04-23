defmodule AirportBot.Duesseldorf do
  @url "https://www.dus.com/de-de/fl%C3%BCge/ankunft"

  def get_flight_strings(flights) do
    flights
    |> Enum.map(fn flight ->
      AirportBot.Main.create_string(flight)
    end)
  end

  def get_flights do
    {:ok, %{body: body}} = HTTPoison.get @url
    parse_body(body)
  end

  def parse_body(body) do
    body
    |> Floki.find(".flyplanTable")
    |> Floki.find("tr")
    |> tl
    |> Enum.map(fn row ->
      time =
        row
        |> Floki.find("td:nth-child(5)")
        |> Floki.text
        |> String.replace("\n", "")
        |> String.trim

      flight =
        row
        |> Floki.find(".flycode")
        |> Floki.text

      destination =
        row
        |> Floki.find(".arrivel")
        |> Floki.text(deep: false)
        |> String.trim

        %{time: time, flight: flight, destination: destination}
    end)
  end

  def create_string(%{time: time, flight: flight, destination: destination} = flight_data) when is_map flight_data do
    "flight '#{flight}' from '#{destination}' arrives at #{time}"
  end
end
