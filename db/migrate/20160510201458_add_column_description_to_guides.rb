class AddColumnDescriptionToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :description, :text
  end
end
