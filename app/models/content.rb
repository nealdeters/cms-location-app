class Content < ActiveRecord::Base
  belongs_to :contentable, polymorphic: true

  validates :content_name, :content_field, presence: true

  def self.search(search)
    if Rails.env.production?
      where("content_name ILIKE ? OR cast(id as text) ILIKE ?", "%#{search}%", "%#{search}%")
    else
      where("content_name LIKE ? OR id LIKE ?", "%#{search}%", "%#{search}%") 
    end
  end

  def content_updated_at
    self.updated_at.strftime("%e %b %Y %I:%M%p")
  end

  def content_created_at
    self.created_at.strftime("%e %b %Y %I:%M%p")
  end
end
