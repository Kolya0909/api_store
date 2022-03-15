class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :price
      t.integer :rating
      t.string :img
      t.integer :type_id
      t.integer :brand_id

      t.timestamps
    end
  end
end
