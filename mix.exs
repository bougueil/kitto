defmodule Kitto.Mixfile do
  use Mix.Project

  @version "0.9.1"

  def project do
    [app: :kitto,
     version: @version,
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps(),
     dialyzer: [
       flags: [:unmatched_returns, :error_handling, :race_conditions, :no_opaque, :underspecs],
       paths: ["_build/dev/lib/kitto/ebin"]],
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [
       "coveralls": :test,
       "coveralls.detail": :test,
       "coveralls.post": :test,
       "coveralls.travis": :test,
       "coveralls.html": :test],
     name: "Kitto",
     source_url: "https://github.com/kittoframework/kitto",
     docs: [extras: ["README.md"], main: "readme"]
    ]
  end

  def application do
    [mod: {Kitto, []},
     applications: [:logger]]
  end

  defp deps do
    [{:cowboy, "~> 2.7"},
     {:plug_cowboy, "~> 2.1"},
     {:plug, "~> 1.8"},
     {:poison, "~> 4.0"},
     {:fs, "~> 4.10"},
     {:httpoison, "~> 1.6"},
     {:ex_doc, "~> 0.21.2", only: :dev},
     {:dialyxir, "~> 0.5.1", only: :dev, runtime: false},
     {:credo, "~> 1.1.5", only: [:dev, :test]},
     {:mock, "~> 0.3.4", only: :test},
     {:excoveralls, "~> 0.12.1", only: :test},
     {:inch_ex, "~> 2.0", only: :docs}]
  end

  defp description, do: "Framework for creating interactive dashboards"

  defp package do
    [
      files: ["lib", "priv", "mix.exs", "package.json", "*.md"],
      maintainers: ["Dimitris Zorbas"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/kittoframework/kitto"}
    ]
  end
end
