defmodule LifelogWeb.UserController do
    use LifelogWeb, :controller

    def signup(conn, _params) do
        render(conn, "signup.html")
    end

    def create(conn, _params) do
    end
end