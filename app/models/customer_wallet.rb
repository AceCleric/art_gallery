class CustomerWallet < ApplicationRecord
  belongs_to :user

  after_update :add_remove_wallet_value

  def add_remove_wallet_value
    wallet = CustomerWallet.find(id)

    if remove_value == 0
      added_value = wallet_value + add_value
      wallet.update_columns(wallet_value: added_value, add_value: 0)
    else
      removed_value = wallet_value - remove_value
      return "No can't do" if removed_value < 0
      wallet.update_columns(wallet_value: removed_value, remove_value: 0)
    end
  end

  private
  def check_add_and_remove_values?
    wallet_value < remove_value
  end
end
