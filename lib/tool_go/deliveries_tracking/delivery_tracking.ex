defmodule ToolGo.DeliveriesTracking.DeliveryTracking do
  alias ToolGo.Orders.Order
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_params [:status, :order_id]

  schema "deliveries_tracking" do
    belongs_to :order, Order
    field :status, :string

    timestamps()
  end

  def changeset(tracking_event \\ %__MODULE__{}, params) do
    tracking_event
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> assoc_constraint(:order)
  end
end
