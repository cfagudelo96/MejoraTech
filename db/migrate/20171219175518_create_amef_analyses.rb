class CreateAmefAnalyses < ActiveRecord::Migration[5.1]
  def change
    create_table :amef_analyses do |t|
      t.integer :fishbone_analysis_id
      t.timestamps
    end
  end
end
