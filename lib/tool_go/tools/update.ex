defmodule ToolGo.Tools.Update do
  alias ToolGo.Tools.Tool
  alias ToolGo.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(Tool, id) do
      nil -> {:error, :not_found}
      tool -> update(tool, params)
    end
  end

  defp update(tool, params) do
    tool
    |> Tool.changeset(params)
    |> Repo.update()
  end
end
