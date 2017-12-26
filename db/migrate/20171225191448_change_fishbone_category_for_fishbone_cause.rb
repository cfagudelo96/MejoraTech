class ChangeFishboneCategoryForFishboneCause < ActiveRecord::Migration[5.1]
  def change
    rename_column :amef_components, :fishbone_category_id, :fishbone_cause_id
  end
end
