defmodule LifelogWeb.BookmarkLiveView do
  use Phoenix.LiveView
  import LinkPreviewer

  alias Lifelog.Bookmarks
  alias LifelogWeb.BookmarkView


  def mount(%{ "current_user": current_user }, socket) do
    {:ok, assign(socket, bookmarks: Bookmarks.list(), current_user: current_user)}
  end

  def render(assigns), do: BookmarkView.render("index.html", assigns)

  def handle_event("add", %{"bookmark" => bookmark}, socket) do
    {:ok, preview} = LinkPreviewer.preview(bookmark["url"])
    attrs = merge_preview_with_bookmark(bookmark, preview)
    {:ok, bookmark} = Bookmarks.add(attrs)
    {:noreply, fetch(socket)}
  end

  def handle_event("delete", %{ "bookmark" => %{ "id" => id } }, socket) do
    {:ok, bookmark} = Bookmarks.remove(id)
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, bookmarks: Bookmarks.list())
  end

  defp merge_preview_with_bookmark(bookmark, preview) do
    %{
      title: preview.title,
      icon_link: preview.icon_link,
      image_link: preview.image_link,
      description: preview.description,
      url: preview.link,
      memo: bookmark["memo"]
    }
  end
end