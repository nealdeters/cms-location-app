class User < ActiveRecord::Base
  
  has_many :brand_users
  has_many :brands, through: :brand_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :timeout_in => 2.hours
end
