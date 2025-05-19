defmodule ToolGo.Stores.Read do
  alias ToolGo.Stores.Store
  alias ToolGo.Repo

  def call(id) do
    case Repo.get(Store, id) do
      nil -> {:error, :not_found}
      store -> {:ok, store}
    end
  end
end
