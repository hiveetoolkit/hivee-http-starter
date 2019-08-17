defmodule HiveeHttpStarter.MixProject do
  @moduledoc false

  use Mix.Project

  def project do
    [
      app: :hivee_http_starter,
      version: "1.0.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [
        tool: Coverex.Task
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {HiveeHttpStarter.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.9"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:plug_secex, "~> 0.1.3"},
      {:plug_checkup, "~> 0.5.0"},
      {:sentry, "~> 7.1"},
      {:distillery, "~> 2.1"},
      {:credo, "~> 1.1", only: [:dev, :test], runtime: false},
      {:coverex, "~> 1.5", only: :test}
    ]
  end
end
