defmodule ToolGo.Users.Delete do
  alias ToolGo.Users.User
  alias ToolGo.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> Repo.delete(user)
    end
  end
end
