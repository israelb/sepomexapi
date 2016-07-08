defmodule SepomexApi.Router do
  use SepomexApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SepomexApi do
    pipe_through :api

    options "/zips", ZipController, :options
  end
end
