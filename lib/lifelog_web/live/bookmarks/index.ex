defmodule LifelogWeb.BookmarkLive.Index do
  use Phoenix.LiveView

  alias Lifelog.Bookmarks
  alias LifelogWeb.BookmarkView

  def mount(_session, socket) do
    {:ok, fetch(socket)}
  end

  def render(assigns), do: BookmarkView.render("index.html", assigns)

  def handle_event("add", %{"bookmark" => bookmark}, socket) do
    IO.puts("bookmark add")
    IO.inspect(bookmark)
    {:ok, bookmark} = Bookmarks.add(bookmark)
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, bookmarks: Bookmarks.list())
  end
end
