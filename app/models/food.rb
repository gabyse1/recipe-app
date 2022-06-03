class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :foods
  has_many :inventory_foods, class_name: 'InventoryFood', foreign_key: 'food_id', inverse_of: :food, dependent: :destroy
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'food_id', inverse_of: :food, dependent: :destroy

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: true, comparison: { greater_than: 0 }
end
