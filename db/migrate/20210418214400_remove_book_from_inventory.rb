class RemoveBookFromInventory < ActiveRecord::Migration[5.2]
  def change
    remove_column :inventories, :book, :string
  end
end
