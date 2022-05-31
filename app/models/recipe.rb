class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :recipes
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'recipe_id', inverse_of: :recipe, dependent: :destroy
end
