defmodule SepomexApi.ZipTest do
  use SepomexApi.ModelCase

  alias SepomexApi.Zip

  @valid_attrs %{d_codigo: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Zip.changeset(%Zip{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Zip.changeset(%Zip{}, @invalid_attrs)
    refute changeset.valid?
  end
end
