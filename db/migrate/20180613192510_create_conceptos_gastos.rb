class CreateConceptosGastos < ActiveRecord::Migration[5.2]
  def change
    create_table :conceptos_gastos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
