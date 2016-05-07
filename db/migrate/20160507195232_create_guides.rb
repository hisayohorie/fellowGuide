class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :photo
      t.integer :rate
      t.string :city

      t.timestamps null: false
    end
  end
end
