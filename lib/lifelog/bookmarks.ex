defmodule Lifelog.Bookmarks do
    import Ecto.Query, warn: false

    alias Lifelog.Repo
    alias Lifelog.Items.Bookmark

    def add(attrs \\ %{}) do
        %Bookmark{}
        |> Bookmark.changeset(attrs)
        |> Repo.insert()
    end

    def list do
        Bookmark
        |> Repo.all()
    end
end