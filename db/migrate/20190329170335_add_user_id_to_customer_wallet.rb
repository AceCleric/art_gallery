class AddUserIdToCustomerWallet < ActiveRecord::Migration[5.2]
  def change
    add_column :customer_wallets, :user_id, :integer, index: true, foreign_key: true
  end
end
