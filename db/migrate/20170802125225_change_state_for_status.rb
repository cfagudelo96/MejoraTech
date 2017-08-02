class ChangeStateForStatus < ActiveRecord::Migration[5.1]
  def change
    rename_column :complaints, :state, :status
  end
end
