defmodule ToolGoWeb.ToolController do
  alias ToolGo.Tools
  alias ToolGoWeb.FallbackController
  use ToolGoWeb, :controller

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, tool} <- Tools.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, %{tool: tool})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, tool} <- Tools.read(id) do
      conn
      |> put_status(:ok)
      |> render(:read, %{tool: tool})
    end
  end

  def update(conn, params) do
    with {:ok, tool} <- Tools.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, %{tool: tool})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, tool} <- Tools.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, %{tool: tool})
    end
  end

  def read_all(conn, _) do
    with tool_list <- Tools.read_all() do
      conn
      |> put_status(:ok)
      |> render(:read_all, %{tool_list: tool_list})
    end
  end
end
