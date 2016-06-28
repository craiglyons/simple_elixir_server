defmodule SimpleServer do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(SimpleServer.Web, [])
    ]

    opts = [strategy: :one_for_one, name: SimpleServer]
    Supervisor.start_link(children, opts)
  end
end
