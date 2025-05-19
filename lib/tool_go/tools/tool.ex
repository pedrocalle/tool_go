defmodule ToolGo.Tools.Tool do
  alias ToolGo.Stores.Store
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_params [:name, :description, :price, :quantity, :image_url]

  schema "tools" do
    field :name, :string
    belongs_to :store, Store
    field :description, :string
    field :price, :float
    field :quantity, :integer
    field :image_url, :string

    timestamps()
  end

  def changeset(store \\ %__MODULE__{}, params) do
    store
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
