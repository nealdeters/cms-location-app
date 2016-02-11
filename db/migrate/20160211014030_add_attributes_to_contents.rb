class AddAttributesToContents < ActiveRecord::Migration
  def change

    add_column :brand_users, :brand_id, :integer
    add_column :brand_users, :user_id, :integer

    add_column :brands, :brand_name, :string
    add_column :brands, :brand_address_1, :string
    add_column :brands, :brand_address_2, :string
    add_column :brands, :brand_city, :string
    add_column :brands, :brand_state, :string
    add_column :brands, :brand_zipcode, :string
    add_column :brands, :brand_phone_number, :string
    add_column :brands, :brand_business_description, :text
    add_column :brands, :brand_service_description, :text
    add_column :brands, :brand_industry, :string

    add_column :locations, :business_name, :string
    add_column :locations, :address_1, :string
    add_column :locations, :address_2, :string
    add_column :locations, :city, :string
    add_column :locations, :state, :string
    add_column :locations, :zipcode, :string
    add_column :locations, :hours_of_operation, :string
    add_column :locations, :business_description, :text
    add_column :locations, :service_description, :text
    add_column :locations, :areas_served, :string
    add_column :locations, :zipcodes_served, :string
    add_column :locations, :languages, :string
    add_column :locations, :meta_description, :string
    add_column :locations, :meta_keywords, :string
    add_column :locations, :meta_title, :string
    add_column :locations, :meta_url, :string

    add_column :contents, :content_name, :string
    add_column :contents, :content_category, :string
    add_column :contents, :contentable_id, :integer, index: true
    add_column :contents, :contentable_type, :string

    add_column :images, :imageable_id, :integer, index: true
    add_column :images, :imageable_type, :string
    add_column :images, :image_name, :string
    add_column :images, :image_category, :string

  end
end
