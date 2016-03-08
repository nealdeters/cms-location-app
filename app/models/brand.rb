class Brand < ActiveRecord::Base
  has_many :brand_users
  has_many :users, through: :brand_users
  has_many :contents, as: :contentable
  has_many :images, as: :imageable
  has_many :locations

  # validates :brand_name, :brand_address_1, presence: true

  def self.search(search)
    if Rails.env.production?
      where("brand_name ILIKE ? OR cast(brand_id as text) ILIKE ?", "%#{search}%", "%#{search}%")
    else
      where("brand_name LIKE ? OR brand_id LIKE ?", "%#{search}%", "%#{search}%") 
    end
  end

  def location_count
    locations.count
  end

end
