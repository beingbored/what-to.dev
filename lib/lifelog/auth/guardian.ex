defmodule Lifelog.Auth.Guardian do
    @moduledoc """

    """

    use Guardian, otp_app: :lifelog

    alias Lifelog.Accounts

    def subject_for_token(user, _claims) do
        sub = to_string(user.id)
        {:ok, sub}
    end

    def resource_from_claims(claims) do
        id = claims["sub"]
        user = Accounts.get(id)
        {:ok, user}
    end
end