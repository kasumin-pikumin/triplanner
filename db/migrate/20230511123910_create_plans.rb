class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.integer :user_id
      t.string :name
      t.date :first_day
      t.date :last_day

      t.timestamps
    end
  end
end
