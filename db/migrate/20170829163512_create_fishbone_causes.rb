class CreateFishboneCauses < ActiveRecord::Migration[5.1]
  def change
    create_table :fishbone_causes do |t|
      t.integer :fishbone_category_id
      t.string :cause

      t.timestamps
    end
  end
end
