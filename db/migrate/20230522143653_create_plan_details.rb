class CreatePlanDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_details do |t|

      t.integer :plan_day_id
      t.time :start_time
      t.time :end_time
      t.string :purpose

      t.timestamps
    end
  end
end
