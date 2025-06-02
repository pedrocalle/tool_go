defmodule ToolGoWeb.OrderJSON do
  alias ToolGo.Orders.Order
   def create(%{order: order}) do
    %{
      message: "order created!",
      data: data(order)
    }
  end

  def read(%{order: order}), do: data(order)

  def update(%{order: order}) do
    %{
      message: "order updated!",
      data: data(order)
    }
  end

  def delete(%{order: order}) do
    %{
      message: "order deleted!",
      data: data(order)
    }
  end

  defp data(%Order{} = order) do
    %{
      id: order.id,
      status: order.status,
      total_value: order.total_value,
      order_date: order.order_date,
      delivery_address: order.delivery_address,
    }
  end
end
