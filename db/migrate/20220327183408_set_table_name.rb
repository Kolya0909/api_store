class SetTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :brand_types, :brands_types
  end
end
