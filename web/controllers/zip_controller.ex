defmodule SepomexApi.ZipController do
  use SepomexApi.Web, :controller

  alias SepomexApi.Zip

  def index(conn, _params) do
    zips = Repo.all(Zip)
    render(conn, "index.json", zips: zips)
  end

  def create(conn, %{"zip" => zip_params}) do
    changeset = Zip.changeset(%Zip{}, zip_params)

    case Repo.insert(changeset) do
      {:ok, zip} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", zip_path(conn, :show, zip))
        |> render("show.json", zip: zip)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SepomexApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    zip = Repo.get!(Zip, id)
    render(conn, "show.json", zip: zip)
  end

  def update(conn, %{"id" => id, "zip" => zip_params}) do
    zip = Repo.get!(Zip, id)
    changeset = Zip.changeset(zip, zip_params)

    case Repo.update(changeset) do
      {:ok, zip} ->
        render(conn, "show.json", zip: zip)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SepomexApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    zip = Repo.get!(Zip, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(zip)

    send_resp(conn, :no_content, "")
  end
end
