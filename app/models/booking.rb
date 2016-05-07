class Booking < ActiveRecord::Base
  belongs_to :experience
  belongs_to :visitor
end
