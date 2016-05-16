class Visitor < ActiveRecord::Base

  mount_uploader :photo, PhotoUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence:true
  #has_one :language
  has_many :bookings
  has_many :experiences, through: :bookings
end

# class Visitor::ParameterSanitizer < Devise::ParameterSanitizer
#   def initialize(*)
#     super
#     permit(:sign_up, keys: [:name, :photo])
#     permit(:account_update, keys: [:name])
#   end
# end
