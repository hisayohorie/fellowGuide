class AddGuideIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :guide_id, :integer
  end
end
