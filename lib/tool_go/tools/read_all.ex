defmodule ToolGo.Tools.ReadAll do
  alias ToolGo.Tools.Tool
  alias ToolGo.Repo

  def call() do
    Repo.all(Tool)
  end
end
