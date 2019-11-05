defmodule Lifelog.Items.Photo do
    use Ecto.Schema
    import Ecto.Changeset
    use Arc.Ecto.Schema


    schema "photos" do
      field :image, Lifelog.Photo.Type

      timestamps()
    end

    def changeset(photo, params \\ %{}) do
      IO.inspect(params)

      photo
      |> cast_attachments(params, [:image])
      |> validate_required([:image])
    end
  end
