class AddColumnDateToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :date, :datetime
  end
end
