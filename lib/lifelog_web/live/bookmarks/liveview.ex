defmodule LifelogWeb.BookmarkLiveView do
  use Phoenix.LiveView

  alias Lifelog.Bookmarks
  alias LifelogWeb.BookmarkView

  def mount(%{ "current_user": current_user }, socket) do
    {:ok, assign(socket, bookmarks: Bookmarks.list(), current_user: current_user)}
  end

  def render(assigns), do: BookmarkView.render("index.html", assigns)

  def handle_event("add", %{"bookmark" => bookmark}, socket) do
    IO.puts("bookmark add")
    IO.inspect(bookmark)
    {:ok, bookmark} = Bookmarks.add(bookmark)
    {:noreply, fetch(socket)}
  end

  def handle_event("delete", %{ "bookmark" => %{ "id" => id } }, socket) do
    {:ok, bookmark} = Bookmarks.remove(id)
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, bookmarks: Bookmarks.list())
  end
end
