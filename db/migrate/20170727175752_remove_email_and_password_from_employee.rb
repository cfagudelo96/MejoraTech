class RemoveEmailAndPasswordFromEmployee < ActiveRecord::Migration[5.1]
  def change
    remove_column :employees, :email
    remove_index :employees, :email
    remove_column :employees, :password
  end
end
