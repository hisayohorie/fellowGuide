class Booking < ActiveRecord::Base
  belongs_to :experiences
  belongs_to :visitors
  belongs_to :guides, through: :experiences
end
