defmodule PdlinkWeb.PageController do
  use PdlinkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
