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
end
