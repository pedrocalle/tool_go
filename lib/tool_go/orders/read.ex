defmodule ToolGo.Orders.Read do
  alias ToolGo.Orders.Order
  alias ToolGo.Repo

  def call(id) do
    case Repo.get(Order, id) do
      nil -> {:error, :not_found}
      order -> {:ok, order}
    end
  end
end
