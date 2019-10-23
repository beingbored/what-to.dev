defmodule Lifelog.Repo.Migrations.AddExcerptToPost do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :excerpt, :string, default: ""
    end
  end
end
