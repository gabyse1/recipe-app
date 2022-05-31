require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryBot.build(:user) }
  
  context 'when validates name' do
    it 'should be present' do
      user.name = nil
      expect(user).to_not be_valid
    end
  end

  context 'when validates email' do
    it 'should be present' do
      user.email = nil
      expect(user).to_not be_valid
    end
  end

  context 'when validates password' do
    it 'should be present' do
      user.password = nil
      expect(user).to_not be_valid
    end
  end
end
