defmodule ToolGo.OrderItems.Create do
  alias ToolGo.Repo
  alias ToolGo.OrderItems.OrderItem

  def call(params) do
    params
    |> OrderItem.changeset()
    |> Repo.insert()
  end
end
