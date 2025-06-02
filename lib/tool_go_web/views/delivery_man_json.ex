defmodule ToolGoWeb.DeliveryManJSON do
  alias ToolGo.DeliveryMen.DeliveryMan

   def create(%{delivery_man: delivery_man}) do
    %{
      message: "delivery_man created!",
      data: data(delivery_man)
    }
  end

  def read(%{delivery_man: delivery_man}), do: data(delivery_man)

  def update(%{delivery_man: delivery_man}) do
    %{
      message: "delivery_man updated!",
      data: data(delivery_man)
    }
  end

  def delete(%{delivery_man: delivery_man}) do
    %{
      message: "delivery_man deleted!",
      data: data(delivery_man)
    }
  end

  defp data(%DeliveryMan{} = delivery_man) do
    %{
      id: delivery_man.id,
      name: delivery_man.name,
      phone: delivery_man.phone,
      email: delivery_man.email,
      vehicle: delivery_man.vehicle,
      vehicle_plate: delivery_man.vehicle_plate,
      status: delivery_man.status
    }
  end
end
