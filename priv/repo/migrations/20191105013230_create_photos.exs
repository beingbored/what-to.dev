defmodule Lifelog.Repo.Migrations.CreatePhotos do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :image, :string

      timestamps()
    end

    create unique_index(:photos, [:image])
  end
end
