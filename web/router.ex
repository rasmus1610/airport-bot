defmodule AirportInterface.Router do
  use AirportInterface.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AirportInterface do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hamburg", PageController, :hamburg
    get "/duesseldorf", PageController, :duesseldorf
  end

  # Other scopes may use custom stacks.
  # scope "/api", AirportInterface do
  #   pipe_through :api
  # end
end
