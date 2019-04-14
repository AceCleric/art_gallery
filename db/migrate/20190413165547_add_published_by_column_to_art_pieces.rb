class AddPublishedByColumnToArtPieces < ActiveRecord::Migration[5.2]
  def change
      add_column :art_pieces, :belongs_to, :integer, index: true
  end
end
