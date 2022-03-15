class SetNameDb < ActiveRecord::Migration[7.0]
  def change
    rename_table :device_infos, :device_info
  end
end
