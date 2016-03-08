class Content < ActiveRecord::Base
  belongs_to :contentable, polymorphic: true

  def self.search(search)
    if Rails.env.production?
      where("content_name ILIKE ? OR cast(id as text) ILIKE ?", "%#{search}%", "%#{search}%")
    else
      where("content_name LIKE ? OR id LIKE ?", "%#{search}%", "%#{search}%") 
    end
  end
end
