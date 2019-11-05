defmodule LifelogWeb.PhotoController do
    use LifelogWeb, :controller
    import Ecto.Query, warn: false
    alias Lifelog.Repo
    alias Lifelog.Items.Photo

    def index(conn, _params) do
      changeset = Photo.changeset(%Photo{})
      query = from(p in Photo, order_by: [desc: p.inserted_at])
      list = Repo.all(query)
      thumbnails = Enum.map(list, fn x -> Lifelog.Photo.url({x.image, x}, :thumb) end)

      IO.inspect(thumbnails)

      conn
      |> render("index.html", %{changeset: changeset, thumbnails: thumbnails})
    end

    def create(conn, %{ "photo" => photo }) do
      changeset = %Photo{} |> Photo.changeset(photo)

      IO.inspect(changeset)
      if changeset.valid? do
        Repo.insert(changeset)
      end

      conn
      |> redirect(to: Routes.photo_path(conn, :index))
    end
  end
