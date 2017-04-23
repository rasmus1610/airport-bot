defmodule AirportBot.Hamburg do
  @url "https://www.hamburg-airport.de/de/abholen.php"

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
    |> Floki.find("table[data-day='today']")
    |> Floki.find("tr")
    |> tl
    |> Enum.map(fn row ->
      time =
        row
        |> Floki.find("td:nth-child(2)")
        |> Floki.text

      flight =
        row
        |> Floki.find("td:nth-child(4)")
        |> Floki.text

      destination =
        row
        |> Floki.find("td:nth-child(3)")
        |> Floki.text

        %{time: time, flight: flight, destination: destination}
    end)
  end
end

# table td:nth-child(2):not([data-th="Parkhaus P2"])
