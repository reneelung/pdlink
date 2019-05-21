use Mix.Config

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.
#
# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix phx.digest` task,
# which you should run after static files are built and
# before starting your production server.
config :pdlink, Pdlink.Endpoint,
       load_from_system_env: true,
       url: [scheme: "https", host: "pdlink.herokuapp.com", port: 443],
       force_ssl: [rewrite_on: [:x_forwarded_proto]],
       cache_static_manifest: "priv/static/cache_manifest.json",
       secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info


# Configure your database
config :pdlink, Pdlink.Repo,
       adapter: Ecto.Adapters.MySQL,
       pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
       ssl: true,
       url: System.get_env("CLEARDB_DATABASE_URL"),

       database: "heroku_fc2ac83b005625b",
       username: "b84ad61bf377e3",
       password: "271a7e7b",
       host: "localhost"

import_config "prod.secret.exs"
