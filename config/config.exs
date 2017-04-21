# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :airport_interface, AirportInterface.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pAhC21QXnr3l3+V0NfZYmt9vNL3sus3RU9o+Wag+s99fBJB+HqKhCb8TXAbDg1j/",
  render_errors: [view: AirportInterface.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AirportInterface.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
