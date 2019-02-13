json.extract! art_piece, :id, :first_name, :last_name, :email, :created_at, :updated_at
json.url art_piece_url(art_piece, format: :json)
