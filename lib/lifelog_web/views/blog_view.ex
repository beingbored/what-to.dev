defmodule LifelogWeb.BlogView do
  use LifelogWeb, :view
  alias Earmark

  def render_markdown(body) do
    {:ok, html, _} = Earmark.as_html(body)
    raw html
  end
end
