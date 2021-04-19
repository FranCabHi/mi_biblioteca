class Inventory < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :book_status, presence: true
    validates :lent, presence: true
  
    paginates_per 15
    enum book_status: {"En estante": 0, "Prestado": 1}
end
