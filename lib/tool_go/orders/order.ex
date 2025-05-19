defmodule ToolGo.Orders.Order do
  alias ToolGo.DeliveryMen.DeliveryMan
  alias ToolGo.Users.User
  alias ToolGo.Stores.Store
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_params [:name, :description, :price, :quantity, :image_url]

  schema "orders" do
    belongs_to :store, Store
    field :status, :string
    field :total_value, :float
    field :order_date, :utc_datetime
    belongs_to :user, User
    field :delivery_address, :string
    belongs_to :delivery_man, DeliveryMan

    timestamps()
  end

  def changeset(order \\ %__MODULE__{}, params) do
    order
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
