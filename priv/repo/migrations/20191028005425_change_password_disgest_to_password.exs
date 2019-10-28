defmodule Lifelog.Repo.Migrations.ChangePasswordDisgestToPassword do
  use Ecto.Migration

  def change do
    rename table("users"), :password_digest, to: :password

    alter table(:users) do
      modify :password, :string
    end
  end
end
