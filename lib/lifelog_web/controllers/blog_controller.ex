defmodule LifelogWeb.BlogController do
  use LifelogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
