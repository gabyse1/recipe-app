class User < ApplicationRecord
  has_many :foods, class_name: 'Food', foreign_key: 'user_id', inverse_of: :user, dependent: :destroy
  has_many :recipes, class_name: 'Recipe', foreign_key: 'user_id', inverse_of: :user, dependent: :destroy
  has_many :inventories, class_name: 'Inventory', foreign_key: 'user_id', inverse_of: :user, dependent: :destroy
end
