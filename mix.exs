defmodule Issuer.Mixfile do
  use Mix.Project

  def project do
    [app: :issuer,
     version: version(),
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
    [applications: [:logger, :bunt]]
  end

  def version do
    File.read!(Path.join("config", "VERSION"))
  end

  #   {:mydep, "~> 0.3.0"}
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:bunt, "~> 0.1"},
      {:ex_ncurses, git: "https://github.com/jfreeze/ex_ncurses.git", only: [:dev, :test]},

      {:credo, "~> 0.4", only: [:dev]},
      {:ex_doc, "~> 0.11", only: :dev}
    ]
  end

  defp description do
    """
    Adds `mix` tasks to easily issue (publish) new versions.
    """
  end

  defp package do
    [ # These are the default files included in the package
     name: :issuer,
     files: ["lib", "config", "mix.exs", "README*"],
     maintainers: ["Aleksei Matiushkin"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/am-kantox/issuer",
              "Docs" => "https://hexdocs.pm/issuer"}]
  end
end
