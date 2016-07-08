defmodule SepomexApi.Router do
  use SepomexApi.Web, :router

  pipeline :api do
    # plug CORSPlug, [origin: "http://localhost"]
    plug :accepts, ["json"]
  end

  scope "/api", SepomexApi do
    pipe_through :api

    resources "/zips", ZipController, only: [:show]
    # options "/zips", ZipController, :options
  end
end
