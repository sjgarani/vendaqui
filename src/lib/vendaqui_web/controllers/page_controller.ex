defmodule VendaquiWeb.PageController do
  use VendaquiWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
