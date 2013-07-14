class Addtypetocategory < ActiveRecord::Migration
  def up
    add_column :categories, :type, :string, limit:10
  end

  def down
  end
end
