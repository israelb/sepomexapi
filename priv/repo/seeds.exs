# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SepomexApi.Repo.insert!(%SepomexApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias SepomexApi.Zip
alias SepomexApi.Repo

defmodule SepomexApi.Seeds do

  def store_it(row) do
    # Map.put_new row, :codigo, "JAL"

    # new_row = _get_code_estado(row[:d_estado])

    new_row = Map.put_new(row, :codigo_estado, _get_code_estado(row[:d_estado]))

    changeset = Zip.changeset(%Zip{}, new_row)
    Repo.insert!(changeset)
  end

  defp _get_code_estado(estado) do
    case _normalize(estado) do
      "aguascalientes" -> "AGS"
      "baja california" -> "BCN"
      "baja california sur" -> "BCS"
      "campeche" -> "CAM"
      "coahuila de zaragoza" -> "COAH"
      "colima" -> "COL"
      "chiapas" -> "CHIS"
      "chihuahua" -> "CHIH"
      "ciudad de mexico" -> "DF"
      "durango" -> "DUR"
      "guanajuato" -> "GTO"
      "guerrero" -> "GRO"
      "hidalgo" -> "HGO"
      "jalisco" -> "JAL"
      "mexico" -> "MEX"
      "michoacan de ocampo" -> "MICH"
      "morelos" -> "MOR"
      "nayarit" -> "NAY"
      "nuevo leon" -> "NL"
      "oaxaca" -> "OAX"
      "puebla" -> "PUE"
      "queretaro" -> "QRO"
      "quintana roo" -> "QRO"
      "san luis potosi" -> "SLP"
      "sinaloa" -> "SIN"
      "sonora" -> "SON"
      "tabasco" -> "TAB"
      "tamaulipas" -> "TAM"
      "tlaxcala" -> "TLAX"
      "veracruz de ignacio de la llave" -> "VER"
      "yucatan" -> "YUC"
      "zacatecas" -> "ZAC"
    end
  end

  defp _normalize(word) do
    word
    |> String.downcase
    |> WordSmith.remove_accents
  end

end

File.stream!("/zip_codes.csv")
  |> Stream.drop(1)
  |> CSV.decode(headers: [:d_codigo, :d_asenta, :d_tipo_asenta, :d_mnpio, :d_estado, :d_ciudad, :d_zona])
  |> Enum.each(&SepomexApi.Seeds.store_it/1)
