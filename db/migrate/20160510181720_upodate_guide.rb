class UpodateGuide < ActiveRecord::Migration
  def change
    remove_column :guides, :email, :string
    remove_column :guides, :email, :string
    add_column :guides, :email, :string, null: false, default: ""

  end
end
