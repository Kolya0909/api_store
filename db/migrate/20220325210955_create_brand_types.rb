class CreateBrandTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :brand_types do |t|

      t.timestamps
    end
  end
end
