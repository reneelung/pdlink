defmodule Pdlink.Links.Link do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pdlink.Ecto.HashId

  @primary_key {:id, :id, [autogenerate: true]}
  schema "links" do
    field :hash, HashId
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    attrs = Map.put_new(attrs, "hash", HashId.generate())
    link
    |> cast(attrs, [:hash, :url])
    |> validate_required([:url])
  end
end
