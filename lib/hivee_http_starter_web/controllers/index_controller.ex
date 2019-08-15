defmodule HiveeHttpStarterWeb.IndexController do
  use HiveeHttpStarterWeb, :controller

  def index(conn, _params) do
    {:ok, body} = HiveeHttpStarter.Example.get_node_info()
    json(conn, body)
  end

  def say(conn, params) do
    {:ok, body} = HiveeHttpStarter.Example.say(params)
    json(conn, body)
  end
end
