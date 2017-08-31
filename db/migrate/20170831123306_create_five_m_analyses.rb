class CreateFiveMAnalyses < ActiveRecord::Migration[5.1]
  def change
    create_table :five_m_analyses do |t|
      t.integer :complaint_id
      t.text :consequence
      t.text :manpower
      t.text :machines
      t.text :materials
      t.text :methods
      t.text :management

      t.timestamps
    end
  end
end
