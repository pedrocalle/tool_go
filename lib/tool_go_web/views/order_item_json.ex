defmodule ToolGoWeb.OrderItemJSON do
alias ToolGo.OrderItems.OrderItem

   def create(%{order_item: order_item}) do
    %{
      message: "order_item created!",
      data: data(order_item)
    }
  end

  def read(%{order_item: order_item}), do: data(order_item)

  def update(%{order_item: order_item}) do
    %{
      message: "order_item updated!",
      data: data(order_item)
    }
  end

  def delete(%{order_item: order_item}) do
    %{
      message: "order_item deleted!",
      data: data(order_item)
    }
  end

  defp data(%OrderItem{} = order_item) do
    %{
      id: order_item.id,
      quantity: order_item.quantity,
    }
  end
end
