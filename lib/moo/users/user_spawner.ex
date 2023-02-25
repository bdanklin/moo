defmodule Moo.Users.UserSpawner do
  use DynamicSupervisor
  alias Moo.Users.User

  def start_link(init_args) do
    DynamicSupervisor.start_link(__MODULE__, [init_args], name: __MODULE__)
  end

  def start_child(child_args) do
    child_spec = %{
      id: User,
      start: {User, :start_link, [child_args]},
      restart: :transient,
      shutdown: :brutal_kill,
      type: :worker
    }

    DynamicSupervisor.start_child(__MODULE__, child_spec)
  end

  def init(_init_args) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end
end
