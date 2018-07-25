class CreateEmpresas < ActiveRecord::Migration[5.2]
  def change
    create_table :empresas do |t|
      t.string :nombre, null: false, index: true
      t.integer :cuit_0, default: 0, index: true
      t.bigint :cuit_1,  default: 0, index: true
      t.integer :cuit_2, default: 0, index: true

      t.timestamps
    end
  end
end
