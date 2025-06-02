defmodule ToolGo.Tools do
  alias ToolGo.Tools.ReadAll
  alias ToolGo.Tools.Delete
  alias ToolGo.Tools.Update
  alias ToolGo.Tools.Read
  alias ToolGo.Tools.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate read(id), to: Read, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate read_all(), to: ReadAll, as: :call
end
