class CreateAmefAnalysisComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :amef_components do |t|
      t.integer :amef_analysis_id
      t.integer :fishbone_category_id
      t.integer :severity, default: 1
      t.integer :frequency, default: 1
      t.integer :detectability, default: 10
      t.timestamps
    end
  end
end
