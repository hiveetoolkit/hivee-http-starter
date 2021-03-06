use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.

# Configures the endpoint
config :hivee_http_starter, HiveeHttpStarterWeb.Endpoint,
  debug_errors: true,
  code_reloader: true,
  watchers: []

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

# Configures the sentry integration
config :sentry,
  environment_name: :dev,
  server_name: System.get_env("SENTRY_SERVER_NAME") || "hivee_http_starter"
