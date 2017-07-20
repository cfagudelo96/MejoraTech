class CreateComplaints < ActiveRecord::Migration[5.1]
  def change
    create_table :complaints do |t|
      t.integer :product_id
      t.string :description
      t.integer :employee_id
      t.integer :classification
      t.string :source
      t.string :batch_number
      t.date :expiration_date
      t.date :effective_date
      t.boolean :pending
      t.date :review_date

      t.timestamps
    end
  end
end
