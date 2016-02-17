class Content < ActiveRecord::Base
  belongs_to :contentable, polymorphic: true

  def self.search(search)
    where("content_name LIKE ? OR id LIKE ?", "%#{search}%", "%#{search}%") 
  end
end
