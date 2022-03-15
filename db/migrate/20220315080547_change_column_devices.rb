class ChangeColumnDevices < ActiveRecord::Migration[7.0]
  def change
    change_column :devices, :rating, :integer, :default => 0
  end
end
