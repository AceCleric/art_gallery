class AddStudentAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name, limit: 200
      t.string :last_name, limit: 200
      t.integer :class_year, limit: 4
      t.string :uuid, limit: 191
    end
  end
end
