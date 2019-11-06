defmodule Lifelog.Bookmarks do
  import Ecto.Query, warn: false

  alias Lifelog.Repo
  alias Lifelog.Items.Bookmark

  def add(attrs \\ %{}) do
    IO.inspect(attrs)
    %Bookmark{}
    |> Bookmark.changeset(attrs)
    |> Repo.insert()
  end

  def get(id) do
    Bookmark
    |> Repo.get!(id)
  end

  def update(id, attrs) do
    bookmark = Bookmark |> Repo.get(id)
    changeset = Bookmark.changeset(bookmark, attrs)
    Repo.update(changeset)
  end

  def remove(id) do
      Bookmark
      |> Repo.get(id)
      |> Repo.delete()
  end

  def list do
    query = from(b in Bookmark, order_by: [desc: b.inserted_at])
    |> Repo.all()
    |> Repo.preload([:user])
  end

  def change_bookmark(%Bookmark{} = bookmark) do
    Bookmark.changeset(bookmark, %{})
  end

  def merge_preview_with_bookmark(bookmark, preview) do
    %{
      title: preview.title,
      icon_link: preview.icon_link,
      image_link: preview.image_link,
      description: preview.description,
      url: preview.link,
      memo: bookmark["memo"],
      user_id: bookmark["user_id"]
    }
  end

end
