class RemovePasswordFromVisitors < ActiveRecord::Migration
  def change
    remove_column :visitors, :password, :string
  end
end
