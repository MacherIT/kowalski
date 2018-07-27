class CreateAdquisiciones < ActiveRecord::Migration[5.2]
  def change
    create_table :adquisiciones do |t|
      t.decimal :precio, null: false, default: 0.0
      t.string :comentarios
      t.integer :tipo_pago, null: false, default: 0
      t.date :inicio
      t.date :fin
      t.references :empresa, foreign_key: true, null: false
      t.references :producto, foreign_key: true, null: false

      t.timestamps
    end
  end
end
