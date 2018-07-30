class AddCuotaToMovimiento < ActiveRecord::Migration[5.2]
  def change
    add_reference :movimientos, :cuota, foreign_key: true
  end
end
