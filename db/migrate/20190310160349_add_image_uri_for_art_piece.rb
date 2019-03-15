class AddImageUriForArtPiece < ActiveRecord::Migration[5.2]
  def change
    add_column :art_pieces, :image_url, :string
  end
end
