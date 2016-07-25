defmodule SepomexApi.ZipView do
  use SepomexApi.Web, :view

  def render("show.json", %{zips: zips})  do
    item = List.first(zips)

    if item != :nil do
      %{
        status: "success",
        message: %{
          codigoPostal: item.d_codigo,
          asentas: render_many(zips, SepomexApi.ZipView, "asentas.json"),
          codigo_estado: item.codigo_estado,
          d_estado: item.d_estado,
          d_mnpio: item.d_mnpio,
          d_ciudad: item.d_ciudad
        }
      }
    else
      %{status: "error", message: "no found"}
    end

  end

  def render("asentas.json", %{zip: zip}) do
    %{ asenta: zip.d_asenta }
  end

end
