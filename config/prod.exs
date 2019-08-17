use Mix.Config

# Configures the endpoint
config :hivee_http_starter, HiveeHttpStarterWeb.Endpoint, code_reloader: false

# Configures the logger
config :logger, level: :info

# Configures the sentry integration
config :sentry,
  environment_name: :prod
