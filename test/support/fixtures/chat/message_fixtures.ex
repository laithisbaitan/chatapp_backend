defmodule Chatapp.Chat.MessageFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Chatapp.Chat.Message` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> Chatapp.Chat.Message.create_message()

    message
  end
end
