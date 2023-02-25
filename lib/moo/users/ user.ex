defmodule Moo.Users.User do
  use GenServer

  def start_link(init_args) do
    GenServer.start_link(__MODULE__, [init_args],
      name: {:via, Registry, {UserRegegistry, init_args.user_id}}
    )
  end

  def init(_args) do
    {:ok, :initial_state}
  end
end
