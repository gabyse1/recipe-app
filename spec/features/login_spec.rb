require 'rails_helper'

RSpec.describe 'Sign in process', type: :feature do
  before :each do
    visit new_user_session_path
  end
  
  context 'when load the log in form, its fields and button' do
    it 'should be present' do
      email_field = find_field('Email')
      password_field = find_field('Password')
      submit_button = find_button('Log in')
      expect(email_field).to_not be_nil
      expect(password_field).to_not be_nil
      expect(submit_button).to_not be_nil
    end
  end
  
  describe 'User login' do
    User.destroy_all
    let(:user) { FactoryBot.build(:user) }
    let(:submit) { 'Log in' }

    before :each do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end

    context 'without email' do
      it "should return `Email can't be blank` message." do
        fill_in 'user_email', with: nil
        click_button submit
        expect(page).to have_text('Invalid Email or password.')
      end
    end

    context 'with incorret email' do
      it "should return `Invalid Email or password.` message." do
        fill_in 'user_email', with: 'wrong@example.com'
        click_button submit
        expect(page).to have_text('Invalid Email or password.')
      end
    end

    context 'without password' do
      it "should return `Password can't be blank` message." do
        fill_in 'user_password', with: nil
        click_button submit
        expect(page).to have_text('Invalid Email or password.')
      end
    end

    context 'with incorret password' do
      it "should return `Invalid Email or password.` message." do
        fill_in 'user_password', with: 'wrong.password'
        click_button submit
        expect(page).to have_text('Invalid Email or password.')
      end
    end

    context 'with complete and corret email and password' do
      it "should return `Signed in successfully.` message." do
        click_button submit
        expect(current_path).to eq(root_path)
        expect(page).to have_text('Signed in successfully.')
      end
    end
  end
end
