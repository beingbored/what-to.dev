defmodule LifelogWeb.BookmarkController do
  use LifelogWeb, :controller
  alias Lifelog.Repo
  alias Lifelog.Bookmarks
  alias Phoenix.LiveView
  alias LifelogWeb.BookmarkLiveView

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
      render(conn, "edit.html", %{bookmark: bookmark})
    else
      conn
      |> put_flash(:error, "Please Sign In!")
      |> redirect(to: Routes.session_path(conn, :new))
      |> halt()
    end
  end

  def update(conn, _params) do
  end
end
