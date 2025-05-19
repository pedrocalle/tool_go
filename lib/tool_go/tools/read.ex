defmodule ToolGo.Tools.Read do
  alias ToolGo.Tools.Tool
  alias ToolGo.Repo

  def call(id) do
    case Repo.get(Tool, id) do
      nil -> {:error, :not_found}
      tool -> {:ok, tool}
    end
  end
end
