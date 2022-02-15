defmodule ChatWeb.PageLive do
  use ChatWeb, :live_view
  require Logger

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end

  @impl true
  def handle_event("random-room", _params, socket) do
    random_slugs = "/" <> MnemonicSlugs.generate_slug(4)
    Logger.info("random_slugs: #{random_slugs}")
    {:noreply, push_redirect(socket, to: random_slugs)}
  end


end
