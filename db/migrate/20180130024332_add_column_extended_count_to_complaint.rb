class AddColumnExtendedCountToComplaint < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :extended_count, :integer, default: 0
  end
end
