defmodule ToolGo.DeliveryMen do
  alias ToolGo.DeliveryMen.Delete
  alias ToolGo.DeliveryMen.Update
  alias ToolGo.DeliveryMen.Read
  alias ToolGo.DeliveryMen.Create

  defdelegate create(params), to: Create, as: :call
  defdelegate read(id), to: Read, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate delete(id), to: Delete, as: :call
end
