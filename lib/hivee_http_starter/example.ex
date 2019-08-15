defmodule HiveeHttpStarter.Example do
  @moduledoc """
  The Example context.
  """

  import HiveeHttpStarterWeb.Gettext

  @doc """
  Return informations about the node.
  ## Examples
      iex> get_node_info()
      {:ok, node_info}
  """
  def get_node_info do
    {:ok, %{message: gettext("Hello, World"), current_node: node(), other_nodes: Node.list()}}
  end

  @doc """
  Return the provided message.
  ## Examples
      iex> say(params)
      {:ok, params}
  """
  def say(params) do
    {:ok, params}
  end
end
