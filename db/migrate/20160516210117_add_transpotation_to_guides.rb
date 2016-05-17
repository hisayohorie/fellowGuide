class AddTranspotationToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :traspotation, :string
  end
end
