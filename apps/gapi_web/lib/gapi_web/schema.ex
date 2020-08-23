defmodule GapiWeb.Schema do
  use Absinthe.Schema
  import_types GapiWeb.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &Gapi.PostResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &Gapi.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &Gapi.UserResolver.find/2
    end
  end
end
