class UpdateGuidesName < ActiveRecord::Migration
  def change
    remove_column :guides, :name, :string
    add_column :guides, :first_name, :string
    add_column :guides, :last_name, :string
  end
end
