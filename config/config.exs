# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

host = System.get_env("HOST") || "0.0.0.0"
port = String.to_integer(System.get_env("PORT") || "4000")

# Configures the endpoint
config :hivee_http_starter, HiveeHttpStarterWeb.Endpoint,
  url: [host: host, port: port],
  http: [port: port],
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

# Configures the prometheus integration
config :prometheus, HiveeHttpStarterWeb.PhoenixInstrumenter,
  controller_call_labels: [:controller, :action],
  duration_buckets: [
    10,
    25,
    50,
    100,
    250,
    500,
    1000,
    2500,
    5000,
    10_000,
    25_000,
    50_000,
    100_000,
    250_000,
    500_000,
    1_000_000,
    2_500_000,
    5_000_000,
    10_000_000
  ],
  registry: :default,
  duration_unit: :microseconds

config :prometheus, HiveeHttpStarterWeb.PipelineInstrumenter,
  labels: [:status_class, :method, :host, :scheme, :request_path],
  duration_buckets: [
    10,
    100,
    1_000,
    10_000,
    100_000,
    300_000,
    500_000,
    750_000,
    1_000_000,
    1_500_000,
    2_000_000,
    3_000_000
  ],
  registry: :default,
  duration_unit: :microseconds

config :prometheus, HiveeHttpStarterWeb.PrometheusExporter,
  path: "/",
  format: :text,
  registry: :default

# Configures the prometheus auth
config :hivee_http_starter,
  prometheus_auth: [
    username: System.get_env("PROMETHEUS_AUTH_USERNAME") || "prometheus",
    password: System.get_env("PROMETHEUS_AUTH_PASSWORD") || "prometheus"
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
