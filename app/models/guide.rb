class Guide < ActiveRecord::Base
  has_many :experiences
  has_and_belongs_to_many :languages
  has_many :bookings, through: :experiences
end
