require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  let!(:user) { create :user }

  before :each do
    get root_path
    sign_in user
  end

  describe 'GET /index' do
    before { get recipes_path }
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

  describe 'GET /show' do
    let(:recipe_attributes) do
      { name: 'recipe XXX', preparation_time: 1.5, cooking_time: 1, description: 'description of recipe XXX',
        public: true }
    end

    before :each do
      post recipes_path, params: { recipe: recipe_attributes }
      @recipe_id = assigns[:recipe].id
      get recipe_path(@recipe_id)
    end

    it 'should get a success response.' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the new template.' do
      expect(response).to render_template(:show)
    end

    it "shouldn't render a different template." do
      expect(response).to_not render_template(:new)
    end
  end

  describe 'GET /new' do
    before { get new_recipe_path }

    it 'should get a success response.' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the new template.' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /create' do
    let(:recipe_attributes) do
      { name: 'recipe XXX', preparation_time: 1.5, cooking_time: 1, description: 'description of recipe XXX',
        public: true }
    end

    it 'should increment the recipe database table count from 0 to 1.' do
      expect do
        post recipes_path, params: { recipe: recipe_attributes }
      end.to change { Recipe.count }.from(0).to(1)
    end

    it 'should redirect to the recipe list page.' do
      post recipes_path, params: { recipe: recipe_attributes }
      follow_redirect!
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Recipe was successfully created.')
    end
  end

  describe 'DELETE /destroy' do
    let(:recipe_attributes) do
      { name: 'recipe XXX', preparation_time: 1.5, cooking_time: 1, description: 'description of recipe XXX',
        public: true }
    end

    before :each do
      post recipes_path, params: { recipe: recipe_attributes }
      @recipe_id = assigns[:recipe].id
    end

    it 'should decrement the recipe database table count from 1 to 0.' do
      expect do
        delete recipe_path(@recipe_id), params: { recipe: { recipe_id: @recipe_id } }
      end.to change { Recipe.count }.from(1).to(0)
    end

    it 'should redirect to the recipe list page.' do
      delete recipe_path(@recipe_id), params: { recipe: { recipe_id: @recipe_id } }

      follow_redirect!
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Recipe was successfully removed.')
    end
  end
end
