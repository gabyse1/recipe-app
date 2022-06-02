require 'rails_helper'

RSpec.describe 'Sign up process.', type: :feature do
  before :each do
    visit new_user_registration_path
  end

  context 'when load the new registration form' do
    it 'should have all sign up fields' do
      name_field = find_field('Name')
      email_field = find_field('Email')
      pass_field = find_field('Password')
      conf_pass_field = find_field('Password confirmation')
      submit_button = find_button('Sign up')

      expect(name_field).to_not be_nil
      expect(email_field).to_not be_nil
      expect(pass_field).to_not be_nil
      expect(conf_pass_field).to_not be_nil
      expect(submit_button).to_not be_nil
    end
  end

  describe 'User registration' do
    let(:user_name) { 'test user' }
    let(:user_email) { 'test.user@example.org' }
    let(:user_password) { 'test.password' }
    let(:submit) { 'Sign up' }

    before :all do
      User.destroy_all
    end

    before :each do
      visit new_user_registration_path
      fill_in 'user_name', with: user_name
      fill_in 'user_email', with: user_email
      fill_in 'user_password', with: user_password
      fill_in 'user_password_confirmation', with: user_password
    end

    context 'without name' do
      it "should return `Name can't be blank` message." do
        fill_in 'user_name', with: nil
        click_button 'Sign up'
        expect(page).to have_text("Name can't be blank")
      end
    end

    context 'without email' do
      it "should return `Email can't be blank` message." do
        fill_in 'user_email', with: nil
        click_button 'Sign up'
        expect(page).to have_text("Email can't be blank")
      end
    end

    context 'without password' do
      it "should return `Password can't be blank` message." do
        fill_in 'user_password', with: nil
        click_button 'Sign up'
        expect(page).to have_text("Password can't be blank")
      end
    end

    context 'Without Password Confirmation' do
      it "should return `Password confirmation doesn't match Password` message." do
        fill_in 'user_password_confirmation', with: nil
        click_button 'Sign up'
        expect(page).to have_text("Password confirmation doesn't match Password")
      end
    end

    context 'with password length less that 6 characters' do
      it 'should return `Password is too short (minimum is 6 characters)` message.' do
        fill_in 'user_password', with: 'a' * 5
        click_button 'Sign up'
        expect(page).to have_text('Password is too short (minimum is 6 characters)')
      end
    end

    context 'With different Password Confirmation' do
      it "should return `Password confirmation doesn't match Password` message." do
        fill_in 'user_password_confirmation', with: 'b' * 6
        click_button 'Sign up'
        expect(page).to have_text("Password confirmation doesn't match Password")
      end
    end

    # context 'With complete and correct data' do
    #   it "should return `Sign up successfully.` message." do
    #     ActionMailer::Base.deliveries.clear
    #     click_button 'Sign up'
    #     puts ActionMailer::Base.deliveries.length
    #     mail = ActionMailer::Base.deliveries.find { |mail|
    #       mail.to.include? user_email
    #     }
    #     # expect(page).to have_text('Sign up successfully')
    #   end
    # end
  end
end
