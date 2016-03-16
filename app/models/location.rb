class Location < ActiveRecord::Base
  belongs_to :brand
  has_many :images, as: :imageable
  has_many :contents, as: :contentable

  geocoded_by :full_address
  after_validation :geocode

  extend FriendlyId
  friendly_id :meta_url, use: [:slugged, :finders]

  validates :business_name, :address_1, :city, :state, :zipcode, :phone_number, presence: true

  def self.search(search)
    if Rails.env.production?
      where("business_name ILIKE ? OR cast(id as text) ILIKE ?", "%#{search}%", "%#{search}%")
    else
      where("business_name LIKE ? OR id LIKE ?", "%#{search}%", "%#{search}%") 
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |location|
        csv << location.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      location_hash = row.to_hash # exclude the price field
      location = Location.where(id: location_hash["id"])

      if location.count == 1
        location.first.update_attributes(location_hash)
      else
        Location.create!(location_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end

  def phone_number_call
    h = {"-" => "","(" => "", ")" =>"", "." => "" }
    new_phone = phone_number.gsub(/\w+/) { |m| h.fetch(m,m)}
    new_phone
  end

  def location_updated_at
    self.updated_at.strftime("%e %b %Y %I:%M%p")
  end

  def location_created_at
    self.created_at.strftime("%e %b %Y %I:%M%p")
  end

  def full_address
    "#{address_1}, #{city}, #{state} #{zipcode}"
  end
end
