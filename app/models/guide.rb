class Guide < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :experiences
  has_and_belongs_to_many :languages
  has_many :bookings, through: :experiences
  has_many :bookings
end

class Guide::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    # permit(:sign_up, keys: [:name])
    permit(:sign_up, keys: [:name, :photo])
    permit(:account_update, keys: [:name])
  end
end
