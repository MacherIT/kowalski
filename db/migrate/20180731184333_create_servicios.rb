class CreateServicios < ActiveRecord::Migration[5.2]
  def change
    create_table :servicios do |t|
      t.decimal :precio, null: false, default: 0.0
      t.string :comentarios
      t.date :inicio
      t.date :fin
      t.references :empresa, foreign_key: true, null: false

      t.timestamps
    end
  end
end
