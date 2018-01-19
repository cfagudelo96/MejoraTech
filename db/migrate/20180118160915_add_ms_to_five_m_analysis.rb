class AddMsToFiveMAnalysis < ActiveRecord::Migration[5.1]
  def change
    add_column :five_m_analyses, :money, :text
    add_column :five_m_analyses, :medium, :text
    add_column :five_m_analyses, :measurements, :text
  end
end
