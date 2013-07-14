class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.boolean :is_default
      t.integer :sort_order
      #t.string :fortype
      t.integer :category_id

      t.timestamps
    end
  end
end
