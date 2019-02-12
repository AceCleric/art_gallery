class CustomerWallet < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_wallet do |t|
      t.float :wallet_value
    end
  end
end
