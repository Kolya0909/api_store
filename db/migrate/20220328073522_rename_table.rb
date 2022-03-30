class RenameTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :brands_types, :brand_types
  end
end
