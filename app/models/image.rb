class Image < ActiveRecord::Base
  # attr_accessor :image_path
  belongs_to :imageable, polymorphic: true
  mount_uploader :image, ImageUploader

  def self.search(search)
    where("image_name LIKE ? OR id LIKE ?", "%#{search}%", "%#{search}%") 
  end
end
