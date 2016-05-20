class AddPaidToVisitor < ActiveRecord::Migration
  def change
    add_column :visitors, :paid, :boolean
  end
end
