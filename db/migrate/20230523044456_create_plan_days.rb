class CreatePlanDays < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_days do |t|

      t.integer :plan_id
      t.integer :day

      t.timestamps
    end
  end
end
