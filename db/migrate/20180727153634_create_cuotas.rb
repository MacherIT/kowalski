class CreateCuotas < ActiveRecord::Migration[5.2]
  def change
    create_table :cuotas do |t|
      t.references :adquisicion, foreign_key: true
      t.decimal :monto, null: false, default: 0.0
      t.date :fecha_vencimiento
      t.string :concepto, null: false, default: "Cuota unica"

      t.timestamps
    end
  end
end
