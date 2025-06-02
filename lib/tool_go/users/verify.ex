defmodule ToolGo.Users.Verify do
  alias ToolGo.Customers.Customer
  alias ToolGo.Repo

  def call(%{"email" => email, "password" => password}) do
    case Repo.get_by(Customer, %{email: email}) do
      nil -> {:error, message: "Email e/ou senha incorretos"}
      customer -> check_password(customer, password)
    end
  end

  defp check_password(customer, password) do
    case Pbkdf2.verify_pass(password, customer.password_hash) do
      false -> {:error, message: "Email e/ou senha incorretos"}
      true -> {:ok, customer}
    end
  end
end
