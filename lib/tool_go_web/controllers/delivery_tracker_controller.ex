defmodule ToolGoWeb.DeliveryTrackerController do
  alias ToolGo.DeliveriesTracking
  alias ToolGoWeb.FallbackController
  use ToolGoWeb, :controller

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, delivery_tracking} <- DeliveriesTracking.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, %{delivery_tracking: delivery_tracking})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, delivery_tracking} <- DeliveriesTracking.read(id) do
      conn
      |> put_status(:ok)
      |> render(:read, %{delivery_tracking: delivery_tracking})
    end
  end

  def update(conn, params) do
    with {:ok, delivery_tracking} <- DeliveriesTracking.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, %{delivery_tracking: delivery_tracking})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, delivery_tracking} <- DeliveriesTracking.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, %{delivery_tracking: delivery_tracking})
    end
  end
end
