defmodule SepomexApi.ZipControllerTest do
  use SepomexApi.ConnCase

  alias SepomexApi.Zip
  @valid_attrs %{ d_codigo: "232323", d_asenta: "33", d_tipo_asenta: "22", d_mnpio: "22", d_estado: "22", d_ciudad: "222", d_cp: "01000", c_estado: "Ciudad de México", c_oficina: "232323",
                  c_cp: "2222", c_tipo_asenta: "San Ángel", c_mnpio: "0000", id_asenta_cpcons: "2222", d_zona: "22222", c_cve_ciudad: "1111"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, zip_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  # test "shows chosen resource", %{conn: conn} do
  #   zip = Repo.insert! %Zip{}
  #   conn = get conn, zip_path(conn, :show, zip)
  #   assert json_response(conn, 200)["data"] == %{"id" => zip.id, "d_codigo" => zip.d_codigo}
  # end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, zip_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, zip_path(conn, :create), zip: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Zip, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, zip_path(conn, :create), zip: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  # test "updates and renders chosen resource when data is valid", %{conn: conn} do
  #   zip = Repo.insert! %Zip{}
  #   conn = put conn, zip_path(conn, :update, zip), zip: @valid_attrs
  #   assert json_response(conn, 200)["data"]["id"]
  #   assert Repo.get_by(Zip, @valid_attrs)
  # end

  # test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
  #   zip = Repo.insert! %Zip{}
  #   conn = put conn, zip_path(conn, :update, zip), zip: @invalid_attrs
  #   assert json_response(conn, 422)["errors"] != %{}
  # end

  # test "deletes chosen resource", %{conn: conn} do
  #   zip = Repo.insert! %Zip{}
  #   conn = delete conn, zip_path(conn, :delete, zip)
  #   assert response(conn, 204)
  #   refute Repo.get(Zip, zip.id)
  # end
end
