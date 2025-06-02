defmodule ToolGo.DeliveriesTracking do
  alias ToolGo.DeliveriesTracking.Delete
  alias ToolGo.DeliveriesTracking.Update
  alias ToolGo.DeliveriesTracking.Read
  alias ToolGo.DeliveriesTracking.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate read(id), to: Read, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
