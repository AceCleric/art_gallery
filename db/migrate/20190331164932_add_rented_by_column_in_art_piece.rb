class AddRentedByColumnInArtPiece < ActiveRecord::Migration[5.2]
  def change
    add_column :art_pieces, :user_id, :integer, index: true, foreign_key: true
  end
end
