defmodule Lifelog.Repo do
  use Ecto.Repo,
    otp_app: :lifelog,
    adapter: Ecto.Adapters.Postgres
end
