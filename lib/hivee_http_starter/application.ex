defmodule HiveeHttpStarter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # Setup prometheus
    HiveeHttpStarterWeb.PhoenixInstrumenter.setup()
    HiveeHttpStarterWeb.PipelineInstrumenter.setup()
    Prometheus.Registry.register_collector(:prometheus_process_collector)
    HiveeHttpStarterWeb.PrometheusExporter.setup()

    # Setup sentry
    {:ok, _} = Logger.add_backend(Sentry.LoggerBackend)
    Logger.configure_backend(Sentry.LoggerBackend, include_logger_metadata: true)

    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      HiveeHttpStarterWeb.Endpoint
      # Starts a worker by calling: HiveeHttpStarter.Worker.start_link(arg)
      # {HiveeHttpStarter.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HiveeHttpStarter.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HiveeHttpStarterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
