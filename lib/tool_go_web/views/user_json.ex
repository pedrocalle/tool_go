defmodule ToolGoWeb.UserJSON do
  alias ToolGo.Users.User
   def create(%{user: user}) do
    %{
      message: "user created!",
      data: data(user)
    }
  end

  def read(%{user: user}), do: data(user)

  def update(%{user: user}) do
    %{
      message: "user updated!",
      data: data(user)
    }
  end

  def delete(%{user: user}) do
    %{
      message: "user deleted!",
      data: data(user)
    }
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      password_hash: user.password_hash,
      phone: user.phone,
      address: user.address
    }
  end
end
