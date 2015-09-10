class AddImageToTours < ActiveRecord::Migration
  def up
    add_attachment :tours, :image
  end

  def down
    remove_attachment :tours, :image
  end
end
