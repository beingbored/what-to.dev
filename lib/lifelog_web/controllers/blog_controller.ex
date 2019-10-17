defmodule LifelogWeb.BlogController do
  use LifelogWeb, :controller
  alias Lifelog.Repo
  alias Lifelog.Posts

  def index(conn, _params) do
    posts = Posts.list_posts()
    render(conn, "index.html", posts: posts)
  end

  def show(conn, _params) do
    render(conn, "show.html")
  end

  def new(conn, _params) do
    changeset = %{}
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, _params) do
    # render(conn, "show.html")
  end

  def edit(conn, _params) do
    render(conn, "edit.html")
  end

  def update(conn, _params) do
    # render(conn, "show.html")
  end

  def destroy(conn, _params) do
    # render(conn, "show.html")
  end

end
