defmodule ToolGo.DeliveryMen.Create do
  alias ToolGo.Repo
  alias ToolGo.DeliveryMen.DeliveryMan

  def call(params) do
    params
    |> DeliveryMan.changeset()
    |> Repo.insert()
  end
end
