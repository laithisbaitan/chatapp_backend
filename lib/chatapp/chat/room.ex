defmodule Chatapp.Chat.Room do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, except: [:__meta__]}

  schema "rooms" do
    field :name, :string
    field :desc, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name, :desc])
    |> validate_required([:name, :desc])
    |> unique_constraint(:name)
    |> validate_length(:name, min: 3, max: 30)
    |> validate_length(:desc, mix: 10, max: 100)
    |> update_change(:name, &String.downcase(&1))
  end
end
