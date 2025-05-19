defmodule ToolGo.Orders.Delete do
  alias ToolGo.Orders.Order
  alias ToolGo.Repo

  def call(id) do
    case Repo.get(Order, id) do
      nil -> {:error, :not_found}
      order -> Repo.delete(order)
    end
  end
end
