class CreateDeviceInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :device_infos do |t|
      t.string :title
      t.string :description
      t.integer :device_id

      t.timestamps
    end
  end
end
