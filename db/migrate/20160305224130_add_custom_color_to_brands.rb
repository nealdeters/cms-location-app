class AddCustomColorToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :primary_color, :string
    add_column :brands, :secondary_color, :string
    add_column :brands, :tertiary_color, :string
  end
end
