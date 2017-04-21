defmodule AirportInterface.PageControllerTest do
  use AirportInterface.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET /hamburg", %{conn: conn} do
    conn = get conn, "/hamburg"
    assert html_response(conn, 200) =~ "Ankünfte Airport Hamburg"
  end

  test "GET /duesseldorf", %{conn: conn} do
    conn = get conn, "/duesseldorf"
    assert html_response(conn, 200) =~ "Ankünfte Airport Duesseldorf"
  end
end
