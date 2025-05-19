defmodule ToolGo.Tools.Create do
  alias ToolGo.Repo
  alias ToolGo.Tools.Tool

  def call(params) do
    params
    |> Tool.changeset()
    |> Repo.insert()
  end
end
