class AddFieldsToComplaint < ActiveRecord::Migration[5.1]
  def change
    change_table :complaints do |t|
      t.string :source_email
      t.text :source_contact_info
      t.integer :contact_employee_id
      t.string :code
      t.integer :company
      t.integer :state
      t.remove :pending
    end
  end
end
