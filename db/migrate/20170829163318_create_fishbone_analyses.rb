class CreateFishboneAnalyses < ActiveRecord::Migration[5.1]
  def change
    create_table :fishbone_analyses do |t|
      t.integer :complaint_id
      t.string :effect

      t.timestamps
    end
  end
end
