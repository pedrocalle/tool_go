defmodule ToolGo.OrderItems.Delete do
  alias ToolGo.OrderItems.OrderItem
  alias ToolGo.Repo

  def call(id) do
    case Repo.get(OrderItem, id) do
      nil -> {:error, :not_found}
      order_item -> Repo.delete(order_item)
    end
  end
end
