defmodule Chatapp.Repo.Migrations.UpdateRoomsNameUniqueIndex do
  use Ecto.Migration

  def change do
    # Drop the existing index if it exists
    drop_if_exists index(:rooms, [:name])

    # Create the unique index correctly
    create unique_index(:rooms, [:name])
  end
end
