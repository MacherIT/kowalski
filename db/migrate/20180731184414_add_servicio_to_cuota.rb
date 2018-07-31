class AddServicioToCuota < ActiveRecord::Migration[5.2]
  def change
    add_reference :cuotas, :servicio, foreign_key: true
  end
end
