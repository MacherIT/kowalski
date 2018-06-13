class CreateCuentasPropias < ActiveRecord::Migration[5.2]
  def change
    create_table :cuentas_propias do |t|
      t.references :dueno, foreign_key: true
      t.string :nombre, null: false

      t.timestamps
    end
  end
end
