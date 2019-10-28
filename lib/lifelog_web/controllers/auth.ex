defmodule LifelogWeb.Auth do
    import Plug.Conn

    def init(opts) do
        IO.puts("AUTH")
        opts
    end

    def call(conn, _ops) do
        user_id = get_session(conn, :user_id)
        user = user_id && Lifelog.Accounts.get(user_id)
        assign(conn, :current_user, user)
    end
end