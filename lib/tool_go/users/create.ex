defmodule ToolGo.Users.Create do
  alias ToolGo.Repo
  alias ToolGo.Users.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
