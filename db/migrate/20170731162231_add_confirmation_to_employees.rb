class AddConfirmationToEmployees < ActiveRecord::Migration[5.1]
  def change
    change_table :employees do |t|
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable
    end

    add_index :employees, :confirmation_token,   unique: true
  end
end
