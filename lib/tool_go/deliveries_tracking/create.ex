defmodule ToolGo.DeliveriesTracking.Create do
  alias ToolGo.Repo
  alias ToolGo.DeliveriesTracking.DeliveryTracking

  def call(params) do
    params
    |> DeliveryTracking.changeset()
    |> Repo.insert()
  end
end
