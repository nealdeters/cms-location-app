class Location < ActiveRecord::Base
  belongs_to :brand
  has_many :images, as: :imageable
  has_many :contents, as: :contentable
end
