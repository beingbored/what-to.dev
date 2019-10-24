defmodule Lifelog.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :password_digest, :boolean

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
