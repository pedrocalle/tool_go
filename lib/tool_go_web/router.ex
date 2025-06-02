defmodule ToolGoWeb.Router do
  use ToolGoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ToolGoWeb do
    pipe_through :api
    resources "/user", UserController, only: [:create, :show, :update, :delete]
    post "/user/login", UserController, :login
    get "/tool", ToolController, :read_all
    resources "/delivery_tracking", DeliveryTrackerController, only: [:create, :show, :update, :delete]
    resources "/delivery_man", DeliveryManController, only: [:create, :show, :update, :delete]
    resources "/order_item", OrderItemController, only: [:create, :show, :update, :delete]
    resources "/order", OrderController, only: [:create, :show, :update, :delete]
    resources "/store", StoreController, only: [:create, :show, :update, :delete]
    resources "/tool", ToolController, only: [:create, :show, :update, :delete]
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:tool_go, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: ToolGoWeb.Telemetry
    end
  end
end
