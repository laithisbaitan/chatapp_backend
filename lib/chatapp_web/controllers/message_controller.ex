defmodule ChatappWeb.MessageController do
  use ChatappWeb, :controller
  alias ChatappWeb.Utils
  alias Chatapp.Chat.Message, as: MessageRepo
  alias Chatapp.Chat

  def get(conn, %{"id" => room_id} = _params) do
    room = Chat.get_room(room_id)

    if(room == nil) do
      conn |> render(:errors, %{errors: ["Invalid room_id"]})
    else
      conn
      |> render(:index, %{success: true, data: MessageRepo.list_messages_by_room(room_id)})
    end
  end

  def create(conn, params) do
    room_id = params["room_id"]

    if Chat.get_room(room_id) == nil do
      conn |> render(:errors, %{errors: ["Invalid room_id"]})

    else
      case MessageRepo.create_message(params) do
        {:ok, _message} ->
          conn
          |> render(:index, %{success: true, message: "Message Created"})

        {:error, %Ecto.Changeset{}=changeset} ->
          conn
          |> render(:errors, %{errors: Utils.format_changeset_errors(changeset)})

        true ->
          conn
          |> render(:index, %{success: false, message: Utils.internal_server_error()})
      end
    end
  end
end
