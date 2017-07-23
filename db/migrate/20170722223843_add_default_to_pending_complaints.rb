class AddDefaultToPendingComplaints < ActiveRecord::Migration[5.1]
  def change
    change_column :complaints, :pending, :boolean, default: true
  end
end
