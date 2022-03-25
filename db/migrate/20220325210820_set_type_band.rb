class SetTypeBand < ActiveRecord::Migration[7.0]
  def change
    drop_table :types_brands
  end
end
