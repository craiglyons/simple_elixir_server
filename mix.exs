defmodule SimpleServer.Mixfile do
  use Mix.Project

  def project do
    [app: :simple_server,
     description: "Simple static web server for testing",
     package: package,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :cowboy, :plug],
     mod: {SimpleServer, []}]
  end

  defp deps do
    [{:cowboy, "~> 1.0"},
		 {:plug, "~> 1.0"},
		 {:ex_doc, ">= 0.0.0", only: :dev}]
  end

	defp package do
		[contributors: ["Craig Lyons"],
     maintainers: ["Craig Lyons (craiglyons.dev@gmail.com)"],
		 licenses: ["MIT"],
		 links: %{github: "https://github.com/craiglyons/simple_server"},
		 files: ~w(lib templates priv mix.exs README.md)]
	end
end
