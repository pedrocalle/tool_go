defmodule ToolGo.Repo.Migrations.AddOrderItemsTable do
  use Ecto.Migration

  def change do
    create table(:order_items, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :tool_id, references(:tools, type: :uuid)
      add :quantity, :integer
      add :order_id, references(:orders, type: :uuid)

      timestamps()
    end
  end
end
