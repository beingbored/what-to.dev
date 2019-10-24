defmodule LifelogWeb.SessionController do
    use LifelogWeb, :controller

    alias Lifelog.Accounts
    alias Lifelog.Items.User

    def index(conn, _params) do
        changeset = Accounts.change_user(%User{})
        render(conn, "index.html", changeset: changeset)
    end

    def create(conn, _params) do
    end
end