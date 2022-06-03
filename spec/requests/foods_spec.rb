require 'rails_helper'

RSpec.describe "Food", type: :request do
  let!(:user) { create :user }

  before :each do
    get root_path
    sign_in user
  end

  describe "GET /index" do
    before { get foods_path }
    it 'should get a success response.' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the index template.' do
      expect(response).to render_template(:index)
    end

    it "shouldn't render a different template." do
      expect(response).to_not render_template(:new)
    end
  end

  describe 'GET /new' do
    before { get new_food_path }

    it 'should get a success response.' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the new template.' do
      expect(response).to render_template(:new)
    end   
  end

  describe 'POST /create' do
    let(:food_attributes) {
      { name: 'onions', measurement_unit: 'kiles', price: 5.5 } 
    }

    it 'should increment the food database table count from 0 to 1.' do
      expect {
        post foods_path, params: { food: food_attributes }
      }.to change { Food.count }.from(0).to(1)
    end

    it 'should redirect to the food list page.' do
      post foods_path, params: { food: food_attributes }
      follow_redirect!
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include("Food was successfully created.")
    end
  end

  describe 'DELETE /destroy' do
    let(:food_attributes) {
      { name: 'onions', measurement_unit: 'kiles', price: 5.5 } 
    }

    before :each do
      post foods_path, params: { food: food_attributes }
      @food_id = assigns[:food].id
    end

    it 'should decrement the food database table count from 1 to 0.' do
      expect {
        delete food_path(@food_id), params: { food: { food_id: @food_id }}
      }.to change { Food.count }.from(1).to(0)
    end

    it 'should redirect to the food list page.' do
      delete food_path(@food_id), params: { food: { food_id: @food_id }}

      follow_redirect!
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include("Food was successfully removed.")
    end
  end
end
