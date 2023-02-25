defmodule Moo do
  use Application

  alias Moo.Users

  @impl true
  def start(_type, _args) do
    children = [
      {Users, []},
      {Servers, []},
      {GameDataPipeline, []}
    ]

    opts = [strategy: :one_for_one, name: Moo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
