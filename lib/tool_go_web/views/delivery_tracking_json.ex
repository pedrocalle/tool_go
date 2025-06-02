defmodule ToolGoWeb.DeliveryTrackingJSON do
  alias ToolGo.DeliveriesTracking.DeliveryTracking
   def create(%{delivery_tracking: delivery_tracking}) do
    %{
      message: "delivery_tracking created!",
      data: data(delivery_tracking)
    }
  end

  def read(%{delivery_tracking: delivery_tracking}), do: data(delivery_tracking)

  def update(%{delivery_tracking: delivery_tracking}) do
    %{
      message: "delivery_tracking updated!",
      data: data(delivery_tracking)
    }
  end

  def delete(%{delivery_tracking: delivery_tracking}) do
    %{
      message: "delivery_tracking deleted!",
      data: data(delivery_tracking)
    }
  end

  defp data(%DeliveryTracking{} = delivery_tracking) do
    %{
      id: delivery_tracking.id,
      status: delivery_tracking.status,
    }
  end
end
