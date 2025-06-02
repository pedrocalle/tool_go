defmodule ToolGo.Users do
  alias ToolGo.Users.Verify
  alias ToolGo.Users.Delete
  alias ToolGo.Users.Update
  alias ToolGo.Users.Read
  alias ToolGo.Users.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate read(id), to: Read, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate verify(params), to: Verify, as: :call
end
