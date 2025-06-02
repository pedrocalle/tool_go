defmodule ToolGoWeb.ToolJSON do
alias ToolGo.Tools.Tool

   def create(%{tool: tool}) do
    %{
      message: "tool created!",
      data: data(tool)
    }
  end

  def read(%{tool: tool}), do: data(tool)

  def update(%{tool: tool}) do
    %{
      message: "tool updated!",
      data: data(tool)
    }
  end

  def delete(%{tool: tool}) do
    %{
      message: "tool deleted!",
      data: data(tool)
    }
  end

   def read_all(%{tool_list: tool_list}) do
    tool_list
    |> Enum.map(fn tool ->
      data(tool)
    end)
  end

  defp data(%Tool{} = tool) do
    %{
      id: tool.id,
      image_url: tool.image_url,
      price: tool.price,
      name: tool.name,
      quantity: tool.quantity,
      inserted_at: tool.inserted_at
    }
  end
end
