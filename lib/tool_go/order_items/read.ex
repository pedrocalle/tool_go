defmodule ToolGo.OrderItems.Read do
  alias ToolGo.OrderItems.OrderItem
  alias ToolGo.Repo

  def call(id) do
    case Repo.get(OrderItem, id) do
      nil -> {:error, :not_found}
      order_item -> {:ok, order_item}
    end
  end
end
