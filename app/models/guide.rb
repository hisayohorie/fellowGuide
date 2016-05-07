class Guide < ActiveRecord::Base
  has_many :experiences
  has_many :languages
  has_many :bookings, through: :experiences
end
