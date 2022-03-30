class AddFieldToBrandType < ActiveRecord::Migration[7.0]
  def change
    add_column :brands_types, :brand_id, :integer
    add_column :brands_types, :type_id, :integer
  end
end
