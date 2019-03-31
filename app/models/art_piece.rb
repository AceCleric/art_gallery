class ArtPiece < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :rentprice, presence: true
  validates :artist, presence: true
  validates :length, presence: true
  validates :width, presence: true
  validates :surface, presence: true
  validates :built_in, presence: true
end
