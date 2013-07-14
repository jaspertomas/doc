class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :is_default
      t.integer :sort_order, default: 0
      t.string :fortype, limit:10

      t.timestamps
    end
  end
end
