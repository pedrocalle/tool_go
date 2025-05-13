defmodule ToolGo.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :email, :string
      add :password_hash, :string
      add :phone, :string
      add :address, :string

      timestamps()
    end

    create unique_index(:users, [:email, :phone])
  end
end
