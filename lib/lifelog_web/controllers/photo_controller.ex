defmodule LifelogWeb.PhotoController do
    use LifelogWeb, :controller
    import Ecto.Query, warn: false
    alias Lifelog.Repo
    alias Lifelog.Items.Photo

    def index(conn, _params) do
      changeset = Photo.changeset(%Photo{})
      query = from(p in Photo, order_by: [desc: p.inserted_at])
      photos = Enum.map(Repo.all(query), fn photo -> map_images(photo) end)

      conn
      |> render("index.html", %{changeset: changeset, photos: photos})
    end

    def create(conn, %{ "photo" => photo }) do
      changeset = %Photo{} |> Photo.changeset(photo)

      if changeset.valid? do
        Repo.insert(changeset)
      end

      conn
      |> redirect(to: Routes.photo_path(conn, :index))
    end


    def delete(conn, %{ "id" => id }) do
      Photo
      |> Repo.get(id)
      |> Repo.delete()
      conn
      |> redirect(to: Routes.photo_path(conn, :index))
    end

    defp map_images(photo) do
      photo
      |>  Map.put(:thumbnail, Lifelog.Photo.url({photo.image, photo}, :thumb))
    end
end
