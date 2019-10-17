defmodule LifelogWeb.BlogController do
  use LifelogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
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
