defmodule AirportBot.Main do
  def create_string(%{time: time, flight: flight, destination: destination} = flight_data) when is_map flight_data  do
    "flight '#{flight}' from '#{destination}' arrives at #{time}"
  end
end
