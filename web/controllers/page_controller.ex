defmodule AirportInterface.PageController do
  use AirportInterface.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def hamburg(conn, _params) do
    flights = AirportBot.Hamburg.get_flights

    render conn, "flights.html", flights: flights, title: "Hamburg"
  end

  def duesseldorf(conn, _params) do
    flights = AirportBot.Duesseldorf.get_flights

    render conn, "flights.html", flights: flights, title: "Düsseldorf"
  end


end
