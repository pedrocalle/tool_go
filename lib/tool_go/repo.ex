defmodule ToolGo.Repo do
  use Ecto.Repo,
    otp_app: :tool_go,
    adapter: Ecto.Adapters.Postgres
end
