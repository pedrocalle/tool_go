defmodule ToolGoWeb.Token do
  alias ToolGoWeb.Endpoint
  alias Phoenix.Token

  @sign_salt System.get_env("SALT") || "default_salt"

  def sign(customer) do
    Token.sign(Endpoint, @sign_salt, %{customer_id: customer.id})
  end

  def verify(token) do
    Token.verify(Endpoint, @sign_salt, token)
  end
end
