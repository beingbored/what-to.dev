defmodule Lifelog.Repo.Migrations.PublishedDefaultFalse do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      modify :published, :boolean, default: false
    end
  end
end
