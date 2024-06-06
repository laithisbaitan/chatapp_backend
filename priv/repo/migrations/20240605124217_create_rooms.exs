defmodule Chatapp.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string, null: false
      add :desc, :text, null: false

      timestamps(type: :utc_datetime)
    end

    unique_index(:rooms, [:name])
  end
end
