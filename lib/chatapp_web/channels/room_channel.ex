defmodule ChatappWeb.RoomChannel do
  use ChatappWeb, :channel
  alias Chatapp.Chat
  alias Chatapp.Chat.Message, as: MessageRepo

  @impl true
  def join("room:"<> room_id, _payload, socket) do
    room = Chat.get_room(room_id)

    if(room == nil) do
      {:error, socket}
    else
      {:ok, assign(socket, :room_id, room_id)}
    end
  end

  @impl true
  def handle_in("new_message", %{"payload" => %{"content" => content}}, socket) do
    room_id = socket.assigns.room_id

    case MessageRepo.create_message(%{content: content, room_id: room_id}) do
      {:ok, message} ->
        broadcast!(socket, "New_Message", %{payload: %{message: message}})
        {:noreply, socket}

      {:error, %Ecto.Changeset{} = _changeset} ->
        {:noreply, socket}

      true ->
        {:noreply, socket}
    end
  end

  @impl true
  def handle_in("new_message", _payload, socket) do
    {:noreply, socket}
  end
end
