class RenameProductsTableToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_table :products, :customers
  end
end
