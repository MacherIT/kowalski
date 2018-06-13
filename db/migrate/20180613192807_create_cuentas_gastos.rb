class CreateCuentasGastos < ActiveRecord::Migration[5.2]
  def change
    create_table :cuentas_gastos do |t|
      t.references :concepto_gasto, foreign_key: true
      t.string :nombre

      t.timestamps
    end
  end
end
