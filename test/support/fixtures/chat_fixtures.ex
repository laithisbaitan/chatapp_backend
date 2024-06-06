defmodule Chatapp.ChatFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Chatapp.Chat` context.
  """

  @doc """
  Generate a room.
  """
  def room_fixture(attrs \\ %{}) do
    {:ok, room} =
      attrs
      |> Enum.into(%{
        desc: "some desc",
        name: "some name"
      })
      |> Chatapp.Chat.create_room()

    room
  end
end
