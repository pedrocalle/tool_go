defmodule ToolGo.DeliveryMen.Update do
  alias ToolGo.DeliveryMen.DeliveryMan
  alias ToolGo.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(DeliveryMan, id) do
      nil -> {:error, :not_found}
      delivery_man -> update(delivery_man, params)
    end
  end

  defp update(delivery_man, params) do
    delivery_man
    |> DeliveryMan.changeset(params)
    |> Repo.update()
  end
end
