class FixTransportation < ActiveRecord::Migration
  def change
    rename_column :guides, :traspotation, :transportation
  end
end
