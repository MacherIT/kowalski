class AddMontoToMovimiento < ActiveRecord::Migration[5.2]
  def change
    add_column :movimientos, :monto, :decimal, null: false, default: 0
  end
end
