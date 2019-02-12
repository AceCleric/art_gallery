class TransactionAdapter < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_adapter do |t|
      t.float :transaction_value
    end
  end
end
