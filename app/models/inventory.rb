class Inventory < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :inventories
  has_many :inventory_foods, class_name: 'InventoryFood', foreign_key: 'inventory_id', inverse_of: :inventory, dependent: :destroy
end
