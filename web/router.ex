defmodule SepomexApi.Router do
  use SepomexApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SepomexApi do
    pipe_through :api

    resources "/zips", ZipController, only: [:show], :options
  end
end
