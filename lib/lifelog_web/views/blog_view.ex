defmodule LifelogWeb.BlogView do
  use LifelogWeb, :view
  alias Earmark

  def render_markdown(body) do
    {:ok, html, _} = Earmark.as_html(body)
    raw(html)
  end

  def title("index.html", _assigns), do: "Blog - LifeLog"
  def title("show.html", assigns), do: "#{assigns[:post].title} - LifeLog"
  def title("new.html", _assigns), do: "새 글 - LifeLog"
  def title(_other, _assigns), do: "LifeLog"

  # TODO: ecto_time 을 timex 로 parse 하는 법을 알아야함.
  # https://en.it1352.com/article/b59e6110740f4b279f1cafdf841afa05.html
  def humanizeDateTime(ecto_time) do
    ecto_time
  end
end
