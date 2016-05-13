class AddNameToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :name, :string
  end
end
