class Brand < ActiveRecord::Base
  has_many :brand_users
  has_many :users, through: :brand_users
  has_many :contents, as: :contentable
  has_many :images, as: :imageable
  has_many :locations

  validates :brand_name, :brand_address_1, presence: true

end
