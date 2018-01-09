class CreateActionPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :action_plans do |t|
      t.integer :amef_component_id
      t.text :action_plan
      t.text :how
      t.date :execution_date
      t.decimal :cost, default: 0
      t.text :evaluation
      t.date :evaluation_date
      t.integer :employee_id

      t.timestamps
    end
  end
end
