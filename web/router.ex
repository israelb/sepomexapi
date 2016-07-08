defmodule SepomexApi.Router do
  use SepomexApi.Web, :router

  pipeline :api do
    plug CORSPlug, [origin: "http://127.0.0.1:3000"]
    plug :accepts, ["json"]
  end

  scope "/api", SepomexApi do
    pipe_through :api

    resources "/zips", ZipController, only: [:show]
  end
end
