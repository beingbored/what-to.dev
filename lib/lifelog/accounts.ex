defmodule Lifelog.Accounts do
  import Ecto.Query

  @moduledoc """
  The Accounts context.
  """

  alias Lifelog.Repo
  alias Lifelog.Items.Post
  alias Lifelog.Items.User

  def get(id) do
    Repo.get(User, id)
  end

  def list_users do
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def authenticate_user(email, password) do
    query = Ecto.Query.from(u in User, where: u.email == ^email)
    Repo.one(query)
    |> check_password(password)
  end

  defp check_password(nil, _), do: {:error, "Incorrect username or password"}

  defp check_password(user, password) do
    case Argon2.verify_pass(password, user.password) do
      true -> {:ok, user}
      false -> {:error, "Incorrect username or password"}
    end
  end
end
