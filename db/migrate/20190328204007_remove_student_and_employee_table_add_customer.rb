class RemoveStudentAndEmployeeTableAddCustomer < ActiveRecord::Migration[5.2]
  def change
    drop_table :students
    drop_table :employees

    create_table :customers do |t|
      t.string :name, limit: 200
      t.boolean :is_active, default: true
    end
  end
end
