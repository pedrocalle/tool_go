defmodule ToolGo.Orders do
  alias ToolGo.Orders.Delete
  alias ToolGo.Orders.Update
  alias ToolGo.Orders.Read
  alias ToolGo.Orders.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate read(id), to: Read, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
