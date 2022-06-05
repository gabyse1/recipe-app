require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { build :user }
  let(:recipe) { build :recipe, user: }

  context 'when validates, name' do
    it 'should be present' do
      recipe.name = nil
      expect(recipe).to_not be_valid
    end
  end

  context 'when validates, preparation_time' do
    it 'should be present' do
      recipe.preparation_time = nil
      expect(recipe).to_not be_valid
    end

    it 'should be a numericality value' do
      recipe.preparation_time = 'aaa'
      expect(recipe).to_not be_valid
    end
  end

  context 'when validates, cooking_time' do
    it 'should be present' do
      recipe.cooking_time = nil
      expect(recipe).to_not be_valid
    end

    it 'should be a numericality value' do
      recipe.cooking_time = 'aaa'
      expect(recipe).to_not be_valid
    end
  end

  context 'when validates, description' do
    it 'should be present' do
      recipe.description = nil
      expect(recipe).to_not be_valid
    end
  end
end
