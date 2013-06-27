class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :content
      t.integer :category_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
