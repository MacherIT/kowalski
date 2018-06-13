class CreateCuentasSueldos < ActiveRecord::Migration[5.2]
  def change
    create_table :cuentas_sueldos do |t|
      t.references :empleado, foreign_key: true
      t.string :nombre, null: false

      t.timestamps
    end
  end
end
