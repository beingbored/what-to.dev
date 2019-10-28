defmodule LifelogWeb.UserView do
  use LifelogWeb, :view

  def title("index.html", _assigns), do: "LifeLog"
  def title("signup.html", _assigns), do: "SIGNUP : LifeLog"
  def title(_other, _assigns), do: "LifeLog"
end
