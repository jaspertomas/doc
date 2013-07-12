class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :parent_id
      t.string :content
      t.integer :category_id
      t.integer :sort_order, default: 0

      t.timestamps
    end
  end
end
