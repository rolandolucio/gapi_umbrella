defmodule Gapi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Gapi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Gapi.PubSub}
      # Start a worker by calling: Gapi.Worker.start_link(arg)
      # {Gapi.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Gapi.Supervisor)
  end
end
