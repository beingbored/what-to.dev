defmodule LifelogWeb.BlogController do
  use LifelogWeb, :controller
  alias Lifelog.Repo
  alias Lifelog.Posts
  alias Lifelog.Items.Post

  def index(conn, _params) do
    posts = Posts.list_posts()
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => post_id}) do
    post = Posts.get(post_id)
    render(conn, "show.html", post: post)
  end

  def new(conn, _params) do
    if conn.assigns.current_user do
      changeset = Posts.change_post(%Post{})
      render(conn, "new.html", changeset: changeset)
    else
      conn
      |> put_flash(:error, "Please Sign In!")
      |> redirect(to: Routes.session_path(conn, :new))
      |> halt()
    end
  end

  def create(conn, %{"post" => post_params}) do
    {:ok, post} = Posts.create_post(post_params)

    conn
    |> put_flash(:info, "#{post.title} created!")
    |> redirect(to: Routes.blog_path(conn, :show, post.id))
  end

  def edit(conn, _params) do
    if conn.assigns.current_user do
      render(conn, "edit.html")
    else
      conn
      |> put_flash(:error, "Please Sign In!")
      |> redirect(to: Routes.session_path(conn, :new))
      |> halt()
    end
  end

  def update(conn, _params) do
    # render(conn, "show.html")
  end

  def destroy(conn, _params) do
    # render(conn, "show.html")
  end
end
