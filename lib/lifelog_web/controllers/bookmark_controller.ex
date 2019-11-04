defmodule LifelogWeb.BookmarkController do
  use LifelogWeb, :controller
  alias Lifelog.Repo
  alias Lifelog.Bookmarks
  alias Phoenix.LiveView
  alias LifelogWeb.BookmarkLiveView
  import LinkPreviewer

  def index(conn, _params) do
    LiveView.Controller.live_render(
      conn,
      BookmarkLiveView,
      session: %{current_user: conn.assigns.current_user}
    )
  end

  def edit(conn, %{"id" => id}) do
    if conn.assigns.current_user do
      bookmark = Bookmarks.get(id)
      changeset = Bookmarks.change_bookmark(bookmark)
      render(conn, "edit.html", %{bookmark: bookmark, changeset: changeset})
    else
      conn
      |> put_flash(:error, "Please Sign In!")
      |> redirect(to: Routes.session_path(conn, :new))
      |> halt()
    end
  end

  def update(conn, %{ "id"=> id, "bookmark" => bookmark }) do
    {:ok, preview} = LinkPreviewer.preview(bookmark["url"])
    attrs = merge_preview_with_bookmark(bookmark, preview)
    bookmark = Bookmarks.update(id, attrs)

    conn
    |> put_flash(:info, "Updated Succeed!")
    |> redirect(to: Routes.bookmark_path(conn, :index))
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
