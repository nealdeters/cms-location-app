class Image < ActiveRecord::Base
  # attr_accessor :image_path
  belongs_to :imageable, polymorphic: true
  mount_uploader :image, ImageUploader

  validates :image_name, :image, presence: true

  def self.search(search)
    if Rails.env.production?
      where("image_name ILIKE ? OR cast(id as text) ILIKE ?", "%#{search}%", "%#{search}%")
    else
      where("image_name LIKE ? OR id LIKE ?", "%#{search}%", "%#{search}%") 
    end
  end
end
