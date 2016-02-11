class Brand < ActiveRecord::Base
  has_many :brand_users
  has_many :users, through: :brand_users
  has_many :contents, as: :contentable
  has_many :images, as: :imageable
  has_many :locations
end
