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
    changeset = Zip.changeset(%Zip{}, row)
    Repo.insert!(changeset)
  end

end

File.stream!("/Users/wsmoak/Downloads/transactions.csv")
  |> Stream.drop(1)
  |> CSV.decode(headers: [:d_codigo, :d_asenta, :d_tipo_asenta, :D_mnpio, :d_estado, :d_ciudad, :d_CP, :c_estado, :c_oficina, :c_CP, :c_tipo_asenta, :c_mnpio, :id_asenta_cpcons, :d_zona, :c_cve_ciudad])
  |> Enum.each(&SepomexApi.Seeds.store_it/1)
