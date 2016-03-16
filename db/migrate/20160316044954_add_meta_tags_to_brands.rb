class AddMetaTagsToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :brand_tagline_title, :string
    add_column :brands, :brand_tagline_summary, :string
    add_column :brands, :brand_meta_description, :string
    add_column :brands, :brand_meta_keywords, :string
    add_column :brands, :brand_meta_title, :string
  end
end
