defmodule ChatappWeb.MessageJSON do

  def index(%{success: success, message: message})do
    %{success: success, message: message}
  end

  def index(%{success: success, data: data}) do
    %{success: success, data: data}
  end

  def errors(%{errors: errors})do
    %{success: false, errors: errors}
  end
end
