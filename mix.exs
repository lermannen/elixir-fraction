defmodule Fraction.Mixfile do
  use Mix.Project

  def project do
    [app: :fraction,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:mix_test_watch, "~> 0.2", only: [:dev, :test]}]
  end

  defp description do
    """
    A library for handling mathematical fractions.
    """
  end

  defp package do
    [
      name: :fraction,
      maintainers: ["Alexander Korling"],
      licenses: ["Apache 2.0"],
      links: %{"Github" => "https://github.com/lermannen/elixir-fraction"}
    ]
  end
end
