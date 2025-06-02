defmodule ToolGoWeb.DeliveryManController do
  alias ToolGo.DeliveryMen
  alias ToolGoWeb.FallbackController
  use ToolGoWeb, :controller

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, delivery_man} <- DeliveryMen.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, %{delivery_man: delivery_man})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, delivery_man} <- DeliveryMen.read(id) do
      conn
      |> put_status(:ok)
      |> render(:read, %{delivery_man: delivery_man})
    end
  end

  def update(conn, params) do
    with {:ok, delivery_man} <- DeliveryMen.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, %{delivery_man: delivery_man})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, delivery_man} <- DeliveryMen.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, %{delivery_man: delivery_man})
    end
  end
end
