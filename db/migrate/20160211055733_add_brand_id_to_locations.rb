class AddBrandIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :brand_id, :integer
  end
end
