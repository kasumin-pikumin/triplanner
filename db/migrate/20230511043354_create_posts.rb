class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.string :title
      t.text :report
      t.integer :night
      t.integer :day
      t.integer :person
      t.integer :favorite
      t.text :comment

      t.timestamps
    end
  end
end
