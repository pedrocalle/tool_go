defmodule ToolGo.Stores.Create do
  alias ToolGo.Repo
  alias ToolGo.Stores.Store

  def call(params) do
    params
    |> Store.changeset()
    |> Repo.insert()
  end
end
