defmodule ToolGo.Repo.Migrations.AddStoresTable do
  use Ecto.Migration

  def change do
    create table(:stores, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :address, :string
      add :phone, :string
      add :open_time, :utc_datetime
      add :close_time, :utc_datetime
      add :email, :string
      add :estimated_time, :integer
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:stores, [:email, :phone])
  end
end
