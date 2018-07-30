class AddPagadaToCuota < ActiveRecord::Migration[5.2]
  def change
    add_column :cuotas, :pagada, :boolean, default: false
  end
end
