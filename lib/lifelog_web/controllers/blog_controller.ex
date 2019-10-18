defmodule LifelogWeb.BlogController do
  use LifelogWeb, :controller
  alias Lifelog.Repo
  alias Lifelog.Posts
  alias Lifelog.Items.Post

  def index(conn, _params) do
    posts = Posts.list_posts()
    render(conn, "index.html", posts: posts)
  end

  def show(conn, _params) do
    render(conn, "show.html")
  end

  def new(conn, _params) do
    changeset = Posts.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    {:ok, post} = Posts.create_post(post_params)
    conn
    |> put_flash(:info, "#{post.title} created!")
    |> redirect(to: Routes.blog_path(conn, :index))
  end

  def edit(conn, _params) do
    render(conn, "edit.html")
  end

  def update(conn, _params) do
    # render(conn, "show.html")
  end

  def destroy(conn, _params) do
    # render(conn, "show.html")
  end

end
