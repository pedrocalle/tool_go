defmodule ToolGoWeb.UserController do
  alias ToolGo.Users
  alias ToolGoWeb.FallbackController
  alias ToolGoWeb.Token
  use ToolGoWeb, :controller

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, %{user: user})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, user} <- Users.read(id) do
      conn
      |> put_status(:ok)
      |> render(:read, %{user: user})
    end
  end

  def login(conn, params) do
    with {:ok, user} <- Users.verify(params) do
      token = Token.sign(user)

      conn
      |> put_status(:ok)
      |> render(:login, %{user: user, token: token})
    end
  end

  def update(conn, params) do
    with {:ok, user} <- Users.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, %{user: user})
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, user} <- Users.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, %{user: user})
    end
  end
end
