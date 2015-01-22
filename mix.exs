defmodule Coinbase.Mixfile do
  use Mix.Project

  def project do
    [app: :coinbase,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps,
     description: "Coinbase API for Elixir",
     package: package,
     source_url: "https://github.com/gregpardo/coinbase-elixir"]
  end

  def application do
    [applications: [:httpotion, :logger, :poison]]
  end

  defp deps do
    [
      {:httpotion, "~> 0.2"},
      {:poison, "~> 1.2.1"}
    ]
  end

  defp package do
    [ # These are the default files included in the package
      files: ["lib", "mix.exs", "README*", "LICENSE*", "license*"],
      contributors: ["Bryan Joseph", "Greg Pardo"],
      licenses: ["MIT"],
      links: %{ "GitHub" => "https://github.com/gregpardo/coinbase-elixir" }
     ]
  end
end
