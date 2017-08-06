class CreateSupports < ActiveRecord::Migration[5.1]
  def change
    create_table :supports do |t|
      t.string :support_file
      t.text :description
      t.integer :complaint_id

      t.timestamps
    end
  end
end
