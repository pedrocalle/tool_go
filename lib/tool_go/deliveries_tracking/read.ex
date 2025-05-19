defmodule ToolGo.DeliveriesTracking.Read do
  alias ToolGo.DeliveriesTracking.DeliveryTracking
  alias ToolGo.Repo

  def call(id) do
    case Repo.get(DeliveryTracking, id) do
      nil -> {:error, :not_found}
      delivery_tracking -> {:ok, delivery_tracking}
    end
  end
end
