class AddUserIdToTours < ActiveRecord::Migration
  def change
    add_column :tours, :user_id, :integer
    add_index :tours, :user_id
  end
end
