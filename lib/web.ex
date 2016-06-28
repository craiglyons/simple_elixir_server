defmodule SimpleServer.Web do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug Plug.Static, at: "/public", from: :simple_server
  plug :match
  plug :dispatch

	plug :not_found
	def not_found(conn, _) do
		send_resp(conn, 404, "not found")
	end

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http SimpleServer.Web, []
  end

  get "/" do
    page_contents = EEx.eval_file("templates/index.html.eex")
    conn |> Plug.Conn.put_resp_content_type("text/html") |> Plug.Conn.send_resp(200, page_contents)

  end
end