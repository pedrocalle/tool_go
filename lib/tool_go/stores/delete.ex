defmodule ToolGo.Stores.Delete do
  alias ToolGo.Stores.Store
  alias ToolGo.Repo

  def call(id) do
    case Repo.get(Store, id) do
      nil -> {:error, :not_found}
      store -> Repo.delete(store)
    end
  end
end
