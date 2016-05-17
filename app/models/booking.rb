class Booking < ActiveRecord::Base
  validates :duration, :date, presence:true


  belongs_to :experience
  belongs_to :visitor
  belongs_to :guide


end
