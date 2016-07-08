defmodule SepomexApi.Zip do
  use SepomexApi.Web, :model

  schema "zips" do
    field :d_codigo,          :string
    field :d_asenta,          :string
    field :d_tipo_asenta,     :string
    field :d_mnpio,           :string
    field :d_estado,          :string
    field :d_ciudad,          :string
    field :d_zona,            :string
    field :codigo_estado,     :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:d_codigo, :d_asenta, :d_tipo_asenta, :d_mnpio, :d_estado, :d_ciudad, :d_zona, :codigo_estado])
    |> validate_required([:d_codigo])
  end
end
