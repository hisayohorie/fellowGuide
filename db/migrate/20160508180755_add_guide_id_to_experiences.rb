class AddGuideIdToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :guide_id, :integer
  end
end
