class AddPhotoToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :photo, :string
  end
end
