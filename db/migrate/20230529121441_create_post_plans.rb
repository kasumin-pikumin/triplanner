class CreatePostPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :post_plans do |t|
      t.references :post, foreign_key: true
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
