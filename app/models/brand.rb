class Brand < ActiveRecord::Base
  has_many :brand_users
  has_many :users, through: :brand_users
  has_many :contents, as: :contentable
  has_many :images, as: :imageable
  has_many :locations

  validates :brand_name, :brand_address_1, :brand_city, :brand_state, :brand_zipcode, :brand_phone_number, :brand_url, presence: true

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

  def brand_updated_at
    self.updated_at.strftime("%e %b %Y %I:%M%p")
  end

  def brand_created_at
    self.created_at.strftime("%e %b %Y %I:%M%p")
  end

end
