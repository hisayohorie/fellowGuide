class CreateJoinTableGuidesLanguages < ActiveRecord::Migration
  def change
    create_join_table :guides, :languages do |t|
      # t.index [:guide_id, :language_id]
      # t.index [:language_id, :guide_id]
    end
  end
end
