class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :recipes
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'recipe_id', inverse_of: :recipe, dependent: :destroy

  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: true, comparison: { greater_than: 0 }
  validates :cooking_time, presence: true, numericality: true, comparison: { greater_than: 0 }
  validates :description, presence: true

  after_initialize :default_values

  private

  def default_values
    self.public ||= false
  end
end
