class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :content
      t.integer :doc_entry_id

      t.timestamps
    end
  end
end
