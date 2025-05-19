defmodule ToolGo.DeliveryMen.DeliveryMan do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_params [:name, :email, :vehicle, :phone, :vehicle_plate, :status]

  schema "delivery_men" do
    field :name, :string
    field :phone, :string
    field :email, :string
    field :vehicle, :string
    field :vehicle_plate, :string
    field :status, :string

    timestamps()
  end

  def changeset(delivery_man \\ %__MODULE__{}, params) do
    delivery_man
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, message: "Email already in use")
  end
end
