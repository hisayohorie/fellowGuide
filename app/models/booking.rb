class Booking < ActiveRecord::Base
  belongs_to :experience
  belongs_to :visitor
  belongs_to :guide

  validates :duration, :date, presence:true

  validate :valid_date_range, :future_date_only, :guide_available?

  def valid_date_range
      if !date.blank? && date > Date.today + 60.days
        errors.add(:date, "Bookings can only be made 60 days in advance.")
      end
    end

  def future_date_only
      if !date.blank? && date <= Date.today
        errors.add(:date, "Bookings can only be made for a later than today's date.")
      end
    end

  def guide_available?
    # get the other bookings for this guide on the same days
    guide_bookings = self.guide.bookings.where("date > ? and date < ?", self.date.beginning_of_day, self.date.end_of_day)
    # if there are bookings, what time are they? and how long?
    if guide_bookings.any?
      guide_bookings.each do |b|
        if b.date.hour == self.date.hour
          errors.add(:date, "sorry the guide is busy that time.")
          return
        end
      end
    end
  end


end
