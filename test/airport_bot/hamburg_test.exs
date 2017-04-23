defmodule AirportBotTest.Hamburg do
  use ExUnit.Case

  test "should parse the hamburg airport site correctly" do
    body = File.read! "test/test_targets/hamburg.html"

    assert AirportBot.Hamburg.parse_body(body)
    |> hd == %{flight: "4U 7779", destination: "Prag - PRG", time: "18:00"}

    assert AirportBot.Hamburg.parse_body(body) |> is_list
  end

  test "should create correct string" do
    flight = %{flight: "4U 7779", destination: "Prag - PRG", time: "18:00"}
    assert AirportBot.Main.create_string(flight) == "flight '4U 7779' from 'Prag - PRG' arrives at 18:00"
  end


end
