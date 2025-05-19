defmodule ToolGo.DeliveryMen.Delete do
  alias ToolGo.DeliveryMen.DeliveryMan
  alias ToolGo.Repo

  def call(id) do
    case Repo.get(DeliveryMan, id) do
      nil -> {:error, :not_found}
      delivery_man -> Repo.delete(delivery_man)
    end
  end
end
