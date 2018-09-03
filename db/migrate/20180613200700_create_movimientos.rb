class CreateMovimientos < ActiveRecord::Migration[5.2]
  def change
    create_table :movimientos do |t|
      t.references :cuenta_debito, foreign_key: true
      t.references :cuenta_credito, foreign_key: true
      t.string :concepto, null: false, default: " "
      t.date :fecha_supuesta
      t.date :fecha_efectiva
      t.boolean :hecha, null: false, default: true

      t.timestamps
    end
  end
end
