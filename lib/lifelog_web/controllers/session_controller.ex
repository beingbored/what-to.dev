defmodule LifelogWeb.SessionController do
    use LifelogWeb, :controller

    def index(conn, _params) do
        render(conn, "index.html")
    end

    def new(conn, _params) do
    end
end