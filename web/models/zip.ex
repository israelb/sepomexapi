defmodule SepomexApi.Zip do
  use SepomexApi.Web, :model

  schema "zips" do
    field :d_codigo,          :string
    field :d_asenta,          :string
    field :d_tipo_asenta,     :string
    field :d_mnpio,           :string
    field :d_estado,          :string
    field :d_ciudad,          :string
    field :d_cp,              :string
    field :c_estado,          :string
    field :c_oficina,         :string
    field :c_cp,              :string
    field :c_tipo_asenta,     :string
    field :c_mnpio,           :string
    field :id_asenta_cpcons,  :string
    field :d_zona,            :string
    field :c_cve_ciudad,      :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:d_codigo, :d_asenta, :d_tipo_asenta, :d_mnpio, :d_estado, :d_ciudad, :d_cp, :c_estado, :c_oficina, :c_cp, :c_tipo_asenta, :c_mnpio, :id_asenta_cpcons, :d_zona, :c_cve_ciudad])
    |> validate_required([:d_codigo])
  end
end
