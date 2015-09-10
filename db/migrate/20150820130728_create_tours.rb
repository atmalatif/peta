class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :judul
      t.string :latitude
      t.string :longitude
      t.text :konten

      t.timestamps null: false
    end
  end
end
