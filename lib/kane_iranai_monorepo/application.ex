defmodule KaneIranaiMonorepo.Application do
  # See https://elixir.hexdocs.pm/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KaneIranaiMonorepoWeb.Telemetry,
      KaneIranaiMonorepo.Repo,
      {DNSCluster,
       query: Application.get_env(:kane_iranai_monorepo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: KaneIranaiMonorepo.PubSub},
      # Start a worker by calling: KaneIranaiMonorepo.Worker.start_link(arg)
      # {KaneIranaiMonorepo.Worker, arg},
      # Start to serve requests, typically the last entry
      KaneIranaiMonorepoWeb.Endpoint
    ]

    # See https://elixir.hexdocs.pm/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KaneIranaiMonorepo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KaneIranaiMonorepoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
