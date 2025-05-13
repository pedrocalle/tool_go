defmodule ToolGo.Repo.Migrations.AddToolsTable do
  use Ecto.Migration

  def change do
    create table(:tools, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :store_id, references(:stores, type: :uuid)
      add :description, :string
      add :price, :float
      add :quantity, :integer
      add :image_url, :string

      timestamps()
    end
  end
end
