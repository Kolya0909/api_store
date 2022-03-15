class CreateBasketDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :basket_devices do |t|
      t.integer :device_id
      t.integer :basket_id

      t.timestamps
    end
  end
end
