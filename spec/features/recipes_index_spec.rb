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
  end

  context 'when loads the show page' do
    it 'should display the recipe name' do
      expect(page).to have_text(recipe.name)
    end

    it 'should display the recipe description' do
      expect(page).to have_text(recipe.description)
    end

    it 'should display the remove button for each recipe' do
      delete_btn = find_button("btn__delete-recipe-#{recipe.id}")
      expect(delete_btn).to_not be_nil
    end

    it 'should display the show link for each recipe' do
      delete_btn = find_link(href: recipe_path(recipe.id))
      expect(delete_btn).to_not be_nil
    end
  end

  context 'when click on the delete button' do
    it 'should redirect to the recipes list page.' do
      click_button "btn__delete-recipe-#{recipe.id}"
      expect(current_path).to eq(recipes_path)
    end

    it 'should display `Recipe was successfully removed.` message.' do
      click_button "btn__delete-recipe-#{recipe.id}"
      expect(page).to have_text('Recipe was successfully removed.')
    end

    it 'should not longer display the removed recipe' do
      click_button "btn__delete-recipe-#{recipe.id}"
      expect(page).to_not have_text(recipe.name)
    end
  end

  context 'when click on the recipe card' do
    it 'should redirect to the recipe show page.' do
      click_link(href: recipe_path(recipe.id))
      expect(current_path).to eq(recipe_path(recipe.id))
    end
  end
end
