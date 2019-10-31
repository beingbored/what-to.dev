defmodule Lifelog.Repo.Migrations.CreateBookmark do
  use Ecto.Migration

  def change do
    create table(:bookmarks) do
      add :url, :string
      add :memo, :string

      timestamps()
    end

    create unique_index(:bookmarks, [:url, :memo])
  end
end
