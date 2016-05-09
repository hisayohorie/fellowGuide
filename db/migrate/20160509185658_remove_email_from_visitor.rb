class RemoveEmailFromVisitor < ActiveRecord::Migration
  def change
    remove_column :visitors, :email, :string
    add_column :visitors, :email, :string, null: false, default: ""
  end
end
