class AddExperienceIdToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :experience_id, :integer
    add_column :bookings, :visitor_id, :integer
  end
end
