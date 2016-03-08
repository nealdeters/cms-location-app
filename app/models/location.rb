class Location < ActiveRecord::Base
  belongs_to :brand
  has_many :images, as: :imageable
  has_many :contents, as: :contentable

  geocoded_by :full_address
  after_validation :geocode

  extend FriendlyId
  friendly_id :meta_url, use: [:slugged, :finders]

  def self.search(search)
    if Rails.env.production?
      where("business_name ILIKE ? OR cast(id as text) ILIKE ?", "%#{search}%", "%#{search}%")
    else
      where("business_name LIKE ? OR id LIKE ?", "%#{search}%", "%#{search}%") 
    end

  end

  def full_address
    "#{address_1}, #{city}, #{state} #{zipcode}"
  end
end
