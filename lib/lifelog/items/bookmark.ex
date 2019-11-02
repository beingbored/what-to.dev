defmodule Lifelog.Items.Bookmark do
    use Ecto.Schema
    import Ecto.Changeset

    schema "bookmarks" do
      field :url, :string
      field :memo, :string
      field :title, :string
      field :icon_link, :string
      field :image_link, :string
      field :description, :string

      timestamps()
    end

    def changeset(bookmark, attrs) do
      bookmark
      |> cast(attrs, [:url, :memo, :title, :icon_link, :image_link, :description])
      |> validate_required([:url])
    end
  end
