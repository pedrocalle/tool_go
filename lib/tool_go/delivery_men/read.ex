defmodule ToolGo.DeliveryMen.Read do
  alias ToolGo.DeliveryMen.DeliveryMan
  alias ToolGo.Repo

  def call(id) do
    case Repo.get(DeliveryMan, id) do
      nil -> {:error, :not_found}
      delivery_man -> {:ok, delivery_man}
    end
  end
end
