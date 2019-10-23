defmodule Lifelog.Repo.Migrations.AddCoverToPost do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :cover, :string, default: ""
      add :thumbnail, :string, default: ""
    end
  end
end
