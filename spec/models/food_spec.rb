require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { build :user }
  let(:food) { build :food, user: }

  context 'when validates, name' do
    it 'should be present' do
      food.name = nil
      expect(food).to_not be_valid
    end
  end

  context 'when validates, measurement_unit' do
    it 'should be present' do
      food.measurement_unit = nil
      expect(food).to_not be_valid
    end
  end

  context 'when validates, price' do
    it 'should be present' do
      food.price = nil
      expect(food).to_not be_valid
    end

    it 'should be a numericality value' do
      food.price = 'aaa'
      expect(food).to_not be_valid
    end
  end
end
