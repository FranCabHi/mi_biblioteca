class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.string :title
      t.string :author
      t.string :status
      t.date :lent
      t.date :returned

      t.timestamps
    end
  end
end
