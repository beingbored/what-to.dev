defmodule Lifelog.Bookmarks do
  import Ecto.Query, warn: false

  alias Lifelog.Repo
  alias Lifelog.Items.Bookmark

  def add(attrs \\ %{}) do
    %Bookmark{}
    |> Bookmark.changeset(attrs)
    |> Repo.insert()
  end

  def remove(id) do
    bookmark =
      Bookmark
      |> Repo.get(id)
      |> Repo.delete()
  end

  def list do
    query = from( b in Bookmark, order_by: [desc: b.inserted_at])
    |> Repo.all()
  end
end
