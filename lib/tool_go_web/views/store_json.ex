defmodule ToolGoWeb.StoreJSON do
  alias ToolGo.Stores.Store
   def create(%{store: store}) do
    %{
      message: "store created!",
      data: data(store)
    }
  end

  def read(%{store: store}), do: data(store)

  def update(%{store: store}) do
    %{
      message: "store updated!",
      data: data(store)
    }
  end

  def delete(%{store: store}) do
    %{
      message: "store deleted!",
      data: data(store)
    }
  end

  defp data(%Store{} = store) do
    %{
      id: store.id,
      name: store.address,
      phone: store.phone,
      open_time: store.open_time,
      close_time: store.close_time,
      email: store.email,
      estimated_time: store.estimated_time
    }
  end
end
