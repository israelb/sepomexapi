defmodule SepomexApi.Repo.Migrations.CreateZip do
  use Ecto.Migration

  def change do
    create table(:zips) do
      add :d_codigo,          :string, null: false
      add :d_asenta,          :string
      add :d_tipo_asenta,     :string
      add :d_mnpio,           :string
      add :d_estado,          :string
      add :d_ciudad,          :string
      add :d_zona,            :string
      add :codigo_estado,     :string

      timestamps()
    end

  end
end
