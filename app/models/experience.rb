class Experience < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :bookings
  belongs_to :guide
  has_many :visitors, through: :bookings
end
