require 'rails_helper'

RSpec.describe 'Food,', type: :feature do
  let!(:user) { create :user }

  before :each do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit new_food_path
  end

  context 'when load the food form, its fields and save button' do
    it 'should be present' do
      name_field = find_field('food[name]')
      unit_field = find_field('food[measurement_unit]')
      price_field = find_field('food[price]')
      submit_button = find_button('Save')
      expect(name_field).to_not be_nil
      expect(unit_field).to_not be_nil
      expect(price_field).to_not be_nil
      expect(submit_button).to_not be_nil
    end
  end

  describe 'Submit form' do
    let!(:food) { create :food, user: }
    let!(:submit) { 'Save' }

    before :each do
      fill_in 'food[name]', with: food.name
      fill_in 'food[measurement_unit]', with: food.measurement_unit
      fill_in 'food[price]', with: food.price
    end

    context 'without name' do
      it "should return `Name can't be blank` message." do
        fill_in 'food[name]', with: nil
        click_button submit
        expect(page).to have_text("Name can't be blank")
      end
    end

    context 'without measurement unit' do
      it "should return `Measurement unit can't be blank` message." do
        fill_in 'food[measurement_unit]', with: nil
        click_button submit
        expect(page).to have_text("Measurement unit can't be blank")
      end
    end

    context 'without price per unit' do
      it "should return `Price can't be blank` message." do
        fill_in 'food[price]', with: nil
        click_button submit
        expect(page).to have_text("Price can't be blank")
      end
    end

    context 'without numeric price' do
      it 'should return `Price is not a number` message.' do
        fill_in 'food[price]', with: 'aaa'
        click_button submit
        expect(page).to have_text('Price is not a number')
      end
    end

    context 'with numeric price less than or equal to zero' do
      it 'should return `Price must be greater than 0` message.' do
        fill_in 'food[price]', with: 'aaa'
        click_button submit
        expect(page).to have_text('Price must be greater than 0')
      end
    end

    context 'with complete and correct data' do
      it 'should redirect to the food list page' do
        click_button submit
        expect(current_path).to eq(foods_path)
      end

      it 'should return `Food created successfully.` message.' do
        click_button submit
        expect(page).to have_text('Food created successfully.')
      end
    end
  end
end
