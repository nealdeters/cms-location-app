class Location < ActiveRecord::Base
  belongs_to :brand
  has_many :images, as: :imageable
  has_many :contents, as: :contentable

  def self.search(search)
    where("business_name LIKE ? OR id LIKE ?", "%#{search}%", "%#{search}%") 
  end
end
