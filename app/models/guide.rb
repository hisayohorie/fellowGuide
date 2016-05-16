class Guide < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :transportation, :photo, :city, :rate, presence:true
  has_many :experiences
  has_and_belongs_to_many :languages
  has_many :bookings, through: :experiences
  has_many :bookings

  def availability_on_date(day)
  # THIS CLASS TAKES THE DAY OF THE MONTH AND RETURNS THE GUIDE AVAILABILITY
  # NEED TO ADD A CHECK FOR MONTH/YEAR UNIQNESS ON NEXT ITERATION

    availableArray = Array.new(24,true)
    self.bookings.each do |booking|
      if booking.date.day == day
        booking.duration.times{|i| availableArray[booking.date.hour + i] = false}
      end
    end
  end


end

# class Guide::ParameterSanitizer < Devise::ParameterSanitizer
#   def initialize(*)
#     super
#     # permit(:sign_up, keys: [:name])
#     permit(:sign_up, keys: [:name, :photo])
#     permit(:account_update, keys: [:name])
#   end
# end
