defmodule Lifelog.Items.Post do
    use Ecto.Schema
    import Ecto.Changeset

    schema "posts" do
      field :title, :string
      field :body, :string
      field :published, :boolean, default: false

      timestamps()
    end
  end