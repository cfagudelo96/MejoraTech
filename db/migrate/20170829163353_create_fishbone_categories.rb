class CreateFishboneCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :fishbone_categories do |t|
      t.integer :fishbone_analysis_id
      t.string :category

      t.timestamps
    end
  end
end
