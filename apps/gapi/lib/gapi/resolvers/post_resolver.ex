defmodule Gapi.PostResolver do
  alias Gapi.Posts

  def all(_args, _info) do
    {:ok, Posts.list_posts()}
  end
end
