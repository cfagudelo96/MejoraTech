class RenameFiveMAnalysisToEightMsAnalysis < ActiveRecord::Migration[5.1]
  def change
    rename_table :five_m_analyses, :eight_ms_analyses
  end
end
