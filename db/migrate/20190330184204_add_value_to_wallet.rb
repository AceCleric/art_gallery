class AddValueToWallet < ActiveRecord::Migration[5.2]
  def change
    add_column :customer_wallets, :add_value, :integer
    add_column :customer_wallets, :remove_value, :integer
  end
end
