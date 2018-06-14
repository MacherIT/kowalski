class CreateMovimientos < ActiveRecord::Migration[5.2]
  def change
    create_table :movimientos do |t|
      t.references :cuenta_debito, polymorphic: true, index: true
      t.references :cuenta_credito, polymorphic: true, index: true
      t.string :concepto
      t.date :fecha_supuesta
      t.date :fecha_efectiva
      t.boolean :hecha

      t.timestamps
    end
  end
end
