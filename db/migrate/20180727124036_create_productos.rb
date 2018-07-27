class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.string :nombre, null: false, default: "", index: true
      t.decimal :precio_default
      t.integer :tipo_pago_default, null: false, default: 0

      t.timestamps
    end
  end
end
