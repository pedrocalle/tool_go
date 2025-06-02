defmodule ToolGo.OrderItems do
  alias ToolGo.OrderItems.Delete
  alias ToolGo.OrderItems.Update
  alias ToolGo.OrderItems.Read
  alias ToolGo.OrderItems.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate read(id), to: Read, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
