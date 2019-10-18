defmodule Lifelog.Posts do
    @moduledoc """
    The Accounts context.
    """

    alias Lifelog.Repo
    alias Lifelog.Items.Post

    # def get_user(id) do
    #   Repo.get(User, id)
    # end

    # def get_user!(id) do
    #   Repo.get!(User, id)
    # end

    # def get_user_by(params) do
    #   Repo.get_by(User, params)
    # end

    def list_posts do
      Repo.all(Post)
    end

    def create_post(attrs \\ %{}) do
      IO.puts("post_prams ->")
      IO.inspect(attrs)
      IO.puts("<- post_prams")

      %Post{}
      |> Post.changeset(attrs)
      |> Repo.insert()
    end

    def change_post(%Post{} = post) do
      Post.changeset(post, %{})
    end
  end