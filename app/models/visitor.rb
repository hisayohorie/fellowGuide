class Visitor < ActiveRecord::Base
  #has_one :language
  has_many :bookings
  has_many :experiences, through: :bookings
end
