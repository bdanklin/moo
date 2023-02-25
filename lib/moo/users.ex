defmodule Moo.Users do
  use Supervisor

  alias Moo.Users.UserSpawner
  alias Moo.Users.UserRegistry

  def start_link(args) do
    Supervisor.start_link(__MODULE__, [args], name: __MODULE__)
  end

  def init(_args) do
    children = [
      {Registry, [keys: :unique, name: UserRegistry]},
      {UserSpawner, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
