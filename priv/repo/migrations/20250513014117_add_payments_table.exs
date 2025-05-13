defmodule ToolGo.Repo.Migrations.AddPaymentsTable do
  use Ecto.Migration

  def change do
    create table(:payments, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :order_id, references(:orders, type: :uuid)
      add :stripe_payment_id, :string
      add :value, :float
      add :status, :string
      add :user_id, references(:users, type: :uuid)

      timestamps()
    end
  end
end
