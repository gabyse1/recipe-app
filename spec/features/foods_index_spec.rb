require 'rails_helper'

RSpec.describe 'Food,', type: :feature do
  let!(:user) { create :user }
  let!(:food) { create :food, user: }

  before :each do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit foods_path
  end

  context 'when loads the page' do
    it 'should display the `New Food` button' do
      new_link = find_link(href: new_food_path)
      expect(new_link).to_not be_nil
    end
  end

  context 'when loads the food list' do
    it 'shouldd display a food table headers' do
      expect(page).to have_text('FOOD')
      expect(page).to have_text('MEASUREMENT UNIT')
      expect(page).to have_text('UNIT PRICE')
      expect(page).to have_text('ACTIONS')
    end

    it 'shouldd display the foods name' do
      expect(page).to have_text(food.name)
    end

    it 'shouldd display the foods messurement unit' do
      expect(page).to have_text(food.measurement_unit)
    end

    it 'shouldd display the foods unit price' do
      expect(page).to have_text(food.price)
    end

    it 'shouldd display the delete button for each food' do
      delete_btn = find_button("btn__delete-food-#{food.id}")
      expect(delete_btn).to_not be_nil
    end
  end

  context 'when click on New Food link' do
    it 'shouldd redirect to the new food form path' do
      click_link(href: new_food_path)
      expect(current_path).to eq(new_food_path)
    end
  end

  context 'when click on the delete button' do
    it 'shouldd redirect to the foods list page.' do
      click_button "btn__delete-food-#{food.id}"
      expect(current_path).to eq(foods_path)
    end

    it 'shouldd display `Food was successfully removed.` message.' do
      click_button "btn__delete-food-#{food.id}"
      expect(page).to have_text('Food was successfully removed.')
    end

    it 'shouldd not longer display the removed food' do
      click_button "btn__delete-food-#{food.id}"
      expect(page).to_not have_text(food.name)
    end
  end
end
