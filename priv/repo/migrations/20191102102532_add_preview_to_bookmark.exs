defmodule Lifelog.Repo.Migrations.AddPreviewToBookmark do
  use Ecto.Migration

  def change do
    alter table(:bookmarks) do
      add :title, :string, default: ""
      add :icon_link, :string, default: ""
      add :image_link, :string, default: ""
      add :description, :string, default: ""
    end
  end
end
