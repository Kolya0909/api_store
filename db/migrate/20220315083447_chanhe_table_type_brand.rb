class ChanheTableTypeBrand < ActiveRecord::Migration[7.0]
  def change
    rename_table :type_brands, :types_brands
  end
end
