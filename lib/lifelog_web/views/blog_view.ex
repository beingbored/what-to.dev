defmodule LifelogWeb.BlogView do
  use LifelogWeb, :view
  alias Earmark

  def render_markdown(body) do
    {:ok, html, _} = Earmark.as_html(body)
    raw html
  end

  def title("index.html", _assigns), do: "Blog - LifeLog"
  def title("show.html", assigns), do: "#{assigns[:post].title} - LifeLog"
  def title("new.html", _assigns), do: "새 글 - LifeLog"
  def title(_other, _assigns), do: "LifeLog"

end
