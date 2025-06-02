defmodule ToolGo.Stores.Store do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_params [:name, :address, :phone, :open_time, :close_time, :email, :estimated_time]

  schema "stores" do
    field :name, :string
    field :address, :string
    field :phone, :string
    field :open_time, :utc_datetime
    field :close_time, :utc_datetime
    field :email, :string
    field :estimated_time, :integer

    timestamps()
  end

  def changeset(store \\ %__MODULE__{}, params) do
    store
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, message: "Email already in use")
  end
end
