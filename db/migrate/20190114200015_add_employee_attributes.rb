class AddEmployeeAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name, limit: 200
      t.string :last_name, limit: 200
      t.string :email, limit: 200
      t.string :uuid, limit: 191
    end
  end
end
