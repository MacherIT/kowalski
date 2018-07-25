class CreateCuentasClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :cuentas_clientes do |t|
      t.references :empresa, foreign_key: true
      t.string :nombre, default: false, index: true

      t.timestamps
    end
  end
end
