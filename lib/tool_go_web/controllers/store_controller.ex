defmodule ToolGoWeb.StoreController do
  alias ToolGo.Stores
  alias ToolGoWeb.FallbackController
  use ToolGoWeb, :controller

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, store} <- Stores.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, %{store: store})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, store} <- Stores.read(id) do
      conn
      |> put_status(:ok)
      |> render(:read, %{store: store})
    end
  end

  def update(conn, params) do
    with {:ok, store} <- Stores.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, %{store: store})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, store} <- Stores.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, %{store: store})
    end
  end
end
