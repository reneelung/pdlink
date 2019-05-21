defmodule Pdlink.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links, primary_key: true) do
      add :hash, :string
      add :url, :string

      timestamps()
    end
  end
end