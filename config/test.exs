use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hivee_http_starter, HiveeHttpStarterWeb.Endpoint,
  http: [port: 4002],
  server: false

# Configures Elixir's Logger level
config :logger, level: :warn

# Configures the sentry integration
config :sentry,
  environment_name: :test
