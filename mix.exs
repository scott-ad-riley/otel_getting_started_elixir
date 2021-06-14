defmodule OtelGettingStartedElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :otel_getting_started_elixir,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        otel_getting_started: [
          version: "0.0.1",
          applications: [otel_getting_started: :permanent]
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {OtelGettingStartedElixir.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:recon, ">= 0.0.0"},
      {:grpcbox, "~> 0.14.0", override: true},
      {:opentelemetry_api, git: "http://github.com/open-telemetry/opentelemetry-erlang", branch: "main", sparse: "apps/opentelemetry_api", override: true},
      {:opentelemetry, git: "http://github.com/open-telemetry/opentelemetry-erlang", branch: "main", sparse: "apps/opentelemetry", override: true},
      {:opentelemetry_exporter, git: "http://github.com/ferd/opentelemetry-erlang", branch: "main", sparse: "apps/opentelemetry_exporter", override: true}
    ]
  end
end
