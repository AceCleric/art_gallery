class CreateArtPieces < ActiveRecord::Migration[5.2]
  def change
    create_table :art_pieces do |t|
      t.string :name, limit: 250
      t.float :rentprice
      t.string :artist, limit: 250
      t.float :length
      t.float :width
      t.float :surface
      t.integer :built_in, limit: 4
    end
  end
end
