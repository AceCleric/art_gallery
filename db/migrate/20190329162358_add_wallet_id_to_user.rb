class AddWalletIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :customer_wallet, index: true
  end
end
