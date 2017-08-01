class AddUnconfirmedEmailToEmployees < ActiveRecord::Migration[5.1]
  def change
    change_table :employees do |t|
      t.string   :unconfirmed_email
    end
  end
end
