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
  end