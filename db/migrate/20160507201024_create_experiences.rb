class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.datetime :date
      t.text :description

      t.timestamps null: false
    end
  end
end
