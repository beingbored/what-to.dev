defmodule LifelogWeb.UserController do
  use LifelogWeb, :controller

  alias Lifelog.Accounts
  alias Lifelog.Items.User

  def signup(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "signup.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do

    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created!")
        |> redirect(to: Routes.session_path(conn, :index))
        # FIXME: 왜 작동안하는거지
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "signup.html", changeset: changeset)
    end
  end
end
