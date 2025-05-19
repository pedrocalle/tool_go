defmodule ToolGo.OrderItems.Update do
  alias ToolGo.OrderItems.OrderItem
  alias ToolGo.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(OrderItem, id) do
      nil -> {:error, :not_found}
      order_item -> update(order_item, params)
    end
  end

  defp update(order_item, params) do
    order_item
    |> OrderItem.changeset(params)
    |> Repo.update()
  end
end
