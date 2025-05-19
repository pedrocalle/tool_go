defmodule ToolGo.Orders.Create do
  alias ToolGo.Repo
  alias ToolGo.Orders.Order

  def call(params) do
    params
    |> Order.changeset()
    |> Repo.insert()
  end
end
