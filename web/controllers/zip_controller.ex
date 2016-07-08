defmodule SepomexApi.ZipController do
  use SepomexApi.Web, :controller

  alias SepomexApi.Zip

  def show(conn, %{"id" => id}) do
    zips = Repo.all(
      from c in SepomexApi.Zip,
      where: c.d_codigo == ^id
    )

    render(conn, "show.json", zips: zips)
  end

end
