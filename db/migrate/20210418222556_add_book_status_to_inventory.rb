class AddBookStatusToInventory < ActiveRecord::Migration[5.2]
  def change
    add_column :inventories, :book_status, :integer, default: 0
  end
end
