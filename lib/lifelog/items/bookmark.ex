defmodule Lifelog.Items.Bookmark do
    use Ecto.Schema
    import Ecto.Changeset

    schema "bookmarks" do
      field :url, :string
      field :memo, :string

      timestamps()
    end

    def changeset(bookmark, attrs) do
      bookmark
      |> cast(attrs, [:url, :memo])
      |> validate_required([:url])
    end
  end
