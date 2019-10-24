defmodule LifelogWeb.UserController do
    use LifelogWeb, :controller

    alias Lifelog.Accounts
    alias Lifelog.Items.User

    def signup(conn, _params) do
        changeset = Accounts.change_user(%User{})
        render(conn, "signup.html", changeset: changeset)
    end

    def create(conn, _params) do
    end
end