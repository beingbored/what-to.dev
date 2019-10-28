defmodule LifelogWeb.SessionController do
  use LifelogWeb, :controller

  alias Lifelog.Accounts
  alias Lifelog.Items.User

  def new(conn, _params) do
    if conn.assigns.current_user do
      conn
      |> put_flash(:error, "You already sign in!")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    else
      changeset = Accounts.change_user(%User{})
      render(conn, "index.html", changeset: changeset)
    end
  end

  def create(conn, %{"user" => %{"email" => email, "password" => password}}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        conn
        |> Accounts.login(user)
        |> put_flash(:info, "Login Successfully")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, message} ->
        conn
        |> put_flash(:error, message)
        |> redirect(to: Routes.session_path(conn, :index))
    end
  end

  def delete(conn, _) do
    conn
    |> LifelogWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
