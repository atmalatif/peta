class AddCategoryIdToTours < ActiveRecord::Migration
  def change
    add_column :tours, :category_id, :integer
  end
end
