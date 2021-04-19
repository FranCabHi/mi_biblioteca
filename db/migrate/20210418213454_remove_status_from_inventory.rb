class RemoveStatusFromInventory < ActiveRecord::Migration[5.2]
  def change
    remove_column :inventories, :status, :string
  end
end
