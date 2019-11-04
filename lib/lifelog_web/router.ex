defmodule LifelogWeb.Router do
  use LifelogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug LifelogWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LifelogWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/blog", BlogController
    get "/design-system", DesignSystemController, :index

    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/signup", UserController, :signup
    post "/signup", UserController, :create

    # LiveView
    resources "/bookmarks", BookmarkController, only: [:index, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", LifelogWeb do
  #   pipe_through :api
  # end
end
