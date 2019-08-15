defmodule HiveeHttpStarterWeb.Router do
  use HiveeHttpStarterWeb, :router

  use Plug.ErrorHandler
  use Sentry.Plug

  pipeline :api do
    plug :accepts, ["json"]

    plug PlugSecex
    plug HiveeHttpStarterWeb.Plugs.Locale
  end

  scope "/" do
    pipe_through :api

    checks = [
      %PlugCheckup.Check{
        name: "api",
        module: HiveeHttpStarterWeb.HealthChecks,
        function: :check_api
      }
    ]

    forward("/healthz", PlugCheckup, PlugCheckup.Options.new(json_encoder: Jason, checks: checks))

    get "/", HiveeHttpStarterWeb.IndexController, :index
    post "/say", HiveeHttpStarterWeb.IndexController, :say
  end
end
