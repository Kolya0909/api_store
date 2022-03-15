class CreateTypeBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :type_brands do |t|
      t.integer :brand_id
      t.integer :type_id

      t.timestamps
    end
  end
end
