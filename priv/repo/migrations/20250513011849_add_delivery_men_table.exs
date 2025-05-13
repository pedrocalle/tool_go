defmodule ToolGo.Repo.Migrations.AddDeliveryMenTable do
  use Ecto.Migration

  def change do
    create table(:delivery_men, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :phone, :string
      add :email, :string
      add :vehicle, :string
      add :vehicle_plate, :string
      add :status, :string

      timestamps()
    end

    create unique_index(:delivery_men, [:vehicle_plate, :email, :phone])
  end
end
