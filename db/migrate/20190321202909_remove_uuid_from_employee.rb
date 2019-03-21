class RemoveUuidFromEmployee < ActiveRecord::Migration[5.2]
  def change
    remove_column :employees, :uuid
  end
end
