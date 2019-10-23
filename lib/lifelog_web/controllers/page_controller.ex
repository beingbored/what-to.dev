defmodule LifelogWeb.PageController do
  use LifelogWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
