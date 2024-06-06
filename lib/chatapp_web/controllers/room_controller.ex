defmodule ChatappWeb.RoomController do
  use ChatappWeb, :controller
  alias Chatapp.Chat
  alias ChatappWeb.Utils

  def list(conn, _params) do
    conn
    |> render(:index, %{success: true, data: Chat.list_rooms()})
  end

  def create(conn, params)do
    case Chat.create_room(params) do
      {:ok, _room} ->
        conn
        |> render(:index, %{success: true, message: "Room Created"})

      {:error, %Ecto.Changeset{}=changeset} ->
        conn
        |> render(:errors, %{errors: Utils.format_changeset_errors(changeset)})

      true ->
        conn
        |> render(:index, %{success: false, message: Utils.internal_server_error()})

    end
  end

  def ping(conn, _params) do
    conn
    |> render(:index, %{success: true, message: "pong"})
  end
end
