class User < ApplicationRecord
  has_secure_password

  has_one :customer_wallet
  has_many :art_pieces

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end
end
