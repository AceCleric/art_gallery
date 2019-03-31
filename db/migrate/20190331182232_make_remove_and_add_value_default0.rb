class MakeRemoveAndAddValueDefault0 < ActiveRecord::Migration[5.2]
  def change
    change_column :customer_wallets, :add_value, :integer, default: 0
    change_column :customer_wallets, :remove_value, :integer, default: 0
  end
end
