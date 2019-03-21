ActiveAdmin.register ArtPiece do
  permit_params :name, :artist, :rentprice, :image_url, :length, :width, :surface, :built_in
end
