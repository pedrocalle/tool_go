defmodule ToolGo.Orders.Update do
  alias ToolGo.Orders.Order
  alias ToolGo.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(Order, id) do
      nil -> {:error, :not_found}
      order -> update(order, params)
    end
  end

  defp update(order, params) do
    order
    |> Order.changeset(params)
    |> Repo.update()
  end
end
