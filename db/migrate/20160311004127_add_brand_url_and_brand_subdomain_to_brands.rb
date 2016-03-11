class AddBrandUrlAndBrandSubdomainToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :brand_url, :string
    add_column :brands, :brand_subdomain, :string
  end
end
