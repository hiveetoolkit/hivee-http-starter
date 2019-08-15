# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :hivee_http_starter, HiveeHttpStarterWeb.Endpoint,
  url: [host: "localhost", port: 80],
  code_reloader: true,
  render_errors: [view: HiveeHttpStarterWeb.ErrorView, accepts: ~w(json)]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures the gettext
config :gettext, :default_locale, "en_US"

# Configures the cluster formation
config :libcluster,
  topologies: [
    hivee_http_starter: [
      strategy: Cluster.Strategy.Gossip
    ]
  ]

# Configures the sentry integration
config :sentry,
  dsn: "",
  release: "",
  log_level: :debug,
  report_deps: true,
  enable_source_code_context: true,
  root_source_code_path: File.cwd!(),
  in_app_module_whitelist: [HiveeHttpStarter]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
