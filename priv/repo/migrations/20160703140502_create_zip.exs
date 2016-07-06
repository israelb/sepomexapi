defmodule SepomexApi.Repo.Migrations.CreateZip do
  use Ecto.Migration

  def change do
    create table(:zips) do
      add :d_codigo,          :string, null: false
      add :d_asenta,          :string, null: false
      add :d_tipo_asenta,     :string, null: false
      add :d_mnpio,           :string, null: false
      add :d_estado,          :string, null: false
      add :d_ciudad,          :string
      add :d_cp,              :string, null: false
      add :c_estado,          :string, null: false
      add :c_oficina,         :string, null: false
      add :c_cp,              :string
      add :c_tipo_asenta,     :string, null: false
      add :c_mnpio,           :string, null: false
      add :id_asenta_cpcons,  :string, null: false
      add :d_zona,            :string, null: false
      add :c_cve_ciudad,      :string

      timestamps()
    end

  end
end
