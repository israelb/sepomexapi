defmodule SepomexApi.ZipView do
  use SepomexApi.Web, :view

  def render("index.json", %{zips: zips}) do
    %{data: render_many(zips, SepomexApi.ZipView, "zip.json")}
  end

  def render("show.json", %{zip: zip}) do
    %{data: render_one(zip, SepomexApi.ZipView, "zip.json")}
  end

  def render("zip.json", %{zip: zip}) do
    %{id: zip.id,
      d_codigo: zip.d_codigo}
  end
end
