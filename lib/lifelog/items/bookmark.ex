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
      belongs_to :user, Lifelog.Items.User

      timestamps()
    end

    def changeset(bookmark, attrs) do
      bookmark
      |> cast(attrs, [:url, :memo, :title, :icon_link, :image_link, :description, :user_id])
      |> validate_required([:url])
    end
  end
