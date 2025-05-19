defmodule ToolGo.Stores.Update do
  alias ToolGo.Stores.Store
  alias ToolGo.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(Store, id) do
      nil -> {:error, :not_found}
      store -> update(store, params)
    end
  end

  defp update(store, params) do
    store
    |> Store.changeset(params)
    |> Repo.update()
  end
end
