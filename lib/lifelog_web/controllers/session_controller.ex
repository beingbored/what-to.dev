defmodule LifelogWeb.SessionController do
    use LifelogWeb, :controller

    alias Lifelog.Accounts
    alias Lifelog.Items.User

    def index(conn, _params) do
        # if (conn.assigns.current_user) do
        #     conn
        # else
        #     changeset = Accounts.change_user(%User{})
        #     conn
        #     |> put_flash(:error, "You must sign in!")
        #     |> redirect(to: Routes.page_path(conn, :index))
        #     |> halt()
        # end
        changeset = Accounts.change_user(%User{})
        render(conn, "index.html", changeset: changeset)
    end

    def create(conn, _params) do
    end
end