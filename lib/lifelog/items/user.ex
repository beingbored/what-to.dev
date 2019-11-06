defmodule Lifelog.Items.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Lifelog.Accounts

  schema "users" do
    field :username, :string
    field :email, :string
    field :password, :string
    has_many :bookmarks, Lifelog.Items.Bookmark

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
    |> put_password_hash()
  end

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(%{"sub" => id}) do
    case Accounts.get(id) do
      nil -> {:error, :resource_not_found}
      user -> {:ok, user}
    end
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Argon2.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset

end
