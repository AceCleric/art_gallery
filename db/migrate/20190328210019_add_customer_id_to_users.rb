class AddCustomerIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :customers, index: true, default: 1
  end
end
