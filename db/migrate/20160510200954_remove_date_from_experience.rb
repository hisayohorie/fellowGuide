class RemoveDateFromExperience < ActiveRecord::Migration
  def change
    remove_column :experiences,:date,:datetime
  end
end
