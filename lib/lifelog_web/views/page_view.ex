defmodule LifelogWeb.PageView do
  use LifelogWeb, :view

  def title("index.html", _assigns), do: "LifeLog"
  def title(_other, _assigns), do: "LifeLog"

end
