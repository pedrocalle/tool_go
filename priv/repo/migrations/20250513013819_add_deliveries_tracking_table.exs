defmodule ToolGo.Repo.Migrations.AddDeliveriesTrackingTable do
  use Ecto.Migration

  def change do
    create table(:tracking_events, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :order_id, references(:orders, type: :uuid)
      add :status, :string, null: false
      add :timestamp, :utc_datetime_usec, null: false

      timestamps(type: :utc_datetime_usec)
    end

    create index(:tracking_events, [:order_id])
    create index(:tracking_events, [:status])
    create index(:tracking_events, [:timestamp])
  end
end
