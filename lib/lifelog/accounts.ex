defmodule Lifelog.Accounts do
    import Ecto.Query
    @moduledoc """
    The Accounts context.
    """

    alias Lifelog.Repo
    alias Lifelog.Items.Post
    alias Lifelog.Items.User

    def get (id) do
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
  end