class CreateExpreinces < ActiveRecord::Migration
  def change
    create_table :expreinces do |t|
      t.datetime :date
      t.text :description

      t.timestamps null: false
    end
  end
end
