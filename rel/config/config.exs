use Mix.Config

host = System.fetch_env!("HOST")
port = String.to_integer(System.fetch_env!("PORT"))

config :hivee_http_starter, HiveeHttpStarterWeb.Endpoint,
  url: [host: host, port: port],
  http: [:inet6, port: port]

# Do not print debug messages in production
config :logger, level: System.fetch_env!("LOG_LEVEL") |> String.to_atom()

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
config :hivee_http_starter, HiveeHttpStarterWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.

# Configures cluster formation
config :libcluster,
  topologies: [
    hivee_http_starter: [
      strategy: Cluster.Strategy.Gossip
    ]
  ]

# Configures the sentry integration
config :sentry,
  dsn: System.fetch_env!("SENTRY_DSN"),
  release: System.fetch_env!("SENTRY_RELEASE"),
  server_name: System.fetch_env!("SENTRY_SERVER_NAME"),
  log_level: System.fetch_env!("SENTRY_LOG_LEVEL") |> String.to_atom()
