defmodule ToolGo.DeliveriesTracking.Update do
  alias ToolGo.DeliveriesTracking.DeliveryTracking
  alias ToolGo.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(DeliveryTracking, id) do
      nil -> {:error, :not_found}
      delivery_tracking -> update(delivery_tracking, params)
    end
  end

  def update(delivery_tracking, params) do
    delivery_tracking
    |> DeliveryTracking.changeset(params)
    |> Repo.update()
  end
end
