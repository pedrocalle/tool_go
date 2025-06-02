defmodule ToolGo.Stores do
  alias ToolGo.Stores.Delete
  alias ToolGo.Stores.Update
  alias ToolGo.Stores.Read
  alias ToolGo.Stores.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate read(id), to: Read, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
