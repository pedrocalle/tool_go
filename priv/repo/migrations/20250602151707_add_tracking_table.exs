defmodule ToolGo.Repo.Migrations.AddTrackingTable do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :delivery_man_id, :string
      add :order_id, :string
      add :latitude, :float
      add :longitude, :float
      add :timestamp, :integer

      timestamps()
    end
  end
end
