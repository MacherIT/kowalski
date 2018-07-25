class CreateCuentasProveedores < ActiveRecord::Migration[5.2]
  def change
    create_table :cuentas_proveedores do |t|
      t.references :empresa, foreign_key: true
      t.string :nombre, index: true

      t.timestamps
    end
  end
end
