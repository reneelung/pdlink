# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pdlink,
  ecto_repos: [Pdlink.Repo],
  hashids_salt: "SECRET_SALT"

# Configures the endpoint
config :pdlink, PdlinkWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CSyzWrGNzkFPBvUr2QfBWrnAwMNX3qHvdf6lahXhJ+97YAi6Nm+ZtHX2iuuTxJX5",
  render_errors: [view: PdlinkWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pdlink.PubSub, adapter: Phoenix.PubSub.PG2]

config :nanoid,
  size: 8,
  alphabet: "_0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
