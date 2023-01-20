defmodule AmazingOtpApp.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AmazingOtpApp.Cache
    ]

    opts = [strategy: :one_for_one, name: AmazingOtpApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
