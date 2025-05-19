defmodule ToolGo.Users.User do
  alias Ecto.Changeset
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_params_create [:name, :email, :password, :phone, :address]
  @required_params_update [:name, :email, :phone, :address]

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :phone, :string
    field :address, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params_create)
    |> validate_required(@required_params_create)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, message: "Email already in use")
    |> add_password_hash()
  end

  def changeset(user, params) do
    user
    |> cast(params, @required_params_update)
    |> validate_required(@required_params_update)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, message: "Email already in use")
    |> add_password_hash()
  end

  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    salt = Argon2.Base.gen_salt()
    change(changeset, %{password_hash: Argon2.Base.hash_password(password, salt)})
  end

  defp add_password_hash(changeset), do: changeset
end
