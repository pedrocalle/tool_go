defmodule ToolGo.OrderItems.OrderItem do
  alias ToolGo.Orders.Order
  alias ToolGo.Tools.Tool
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_params [:quantity]

  schema "order_items" do
    belongs_to :tool, Tool
    field :quantity, :integer
    belongs_to :order, Order

    timestamps()
  end

  def changeset(order_item \\ %__MODULE__{}, params) do
    order_item
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:quantity, greater_than_or_equal_to: 0)
  end
end
