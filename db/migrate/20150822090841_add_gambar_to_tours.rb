class AddGambarToTours < ActiveRecord::Migration
  def change
    add_column :tours, :gambar, :string
  end
end
