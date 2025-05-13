defmodule ToolGo.Repo.Migrations.AddOrdersTable do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :store_id, references(:stores, type: :uuid)
      add :status, :string
      add :total_value, :float
      add :order_date, :utc_datetime
      add :user_id, references(:users, type: :uuid)
      add :delivery_address, :string
      add :delivery_man_id, references(:delivery_men, type: :uuid)

      timestamps()
    end
  end
end
