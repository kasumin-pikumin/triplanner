class RemovePlanIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :plan_id, :integer
  end
end
