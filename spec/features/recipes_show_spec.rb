require 'rails_helper'

RSpec.describe 'Recipe,', type: :feature do
  let!(:user) { create :user }
  let!(:recipe) { create :recipe, user: }

  before :each do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit recipes_path

    click_link(href: recipe_path(recipe.id))
  end

  context 'when loads the show page' do
    it 'should display the recipe name' do
      expect(page).to have_text(recipe.name)
    end

    it 'should display the recipe preparation time' do
      expect(page).to have_content("#{recipe.preparation_time} hours")
    end

    it 'should display the recipe cooking time' do
      expect(page).to have_text("#{recipe.cooking_time} hours")
    end

    it 'should display the recipe description' do
      expect(page).to have_text(recipe.description)
    end

    it 'should display the generate ingredient link' do
      shopping_btn = find_link(id: 'link__shopping-list')
      expect(shopping_btn).to_not be_nil
    end

    it 'should display the add ingredient link' do
      ingredient_btn = find_link(id: 'link__add-ingredient')
      expect(ingredient_btn).to_not be_nil
    end
  end
end
