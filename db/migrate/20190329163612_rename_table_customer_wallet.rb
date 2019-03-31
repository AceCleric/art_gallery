class RenameTableCustomerWallet < ActiveRecord::Migration[5.2]
  def change
    rename_table :customer_wallet, :customer_wallets
  end
end
