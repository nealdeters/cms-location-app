class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  def self.search(search)
    where("image_name LIKE ? OR id LIKE ?", "%#{search}%", "%#{search}%") 
  end
end
