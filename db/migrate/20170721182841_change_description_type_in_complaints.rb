class ChangeDescriptionTypeInComplaints < ActiveRecord::Migration[5.1]
  def change
    change_column :complaints, :description, :text
  end
end
