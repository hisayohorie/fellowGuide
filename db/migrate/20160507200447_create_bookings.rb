class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :duration
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
