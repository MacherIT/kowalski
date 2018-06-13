class CreateDuenos < ActiveRecord::Migration[5.2]
  def change
    create_table :duenos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
