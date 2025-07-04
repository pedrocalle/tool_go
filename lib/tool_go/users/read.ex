defmodule ToolGo.Users.Read do
  alias ToolGo.Users.User
  alias ToolGo.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
