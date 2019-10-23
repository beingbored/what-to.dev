defmodule Lifelog.Items.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    field :excerpt, :string
    field :cover, :string
    field :thumbnail, :string
    field :published, :boolean, default: false

    timestamps()
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :excerpt])
    |> validate_required([:title, :body, :excerpt])
  end
end
