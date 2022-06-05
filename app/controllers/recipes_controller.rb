class RecipesController < ApplicationController
  def index
    @curret_user = current_user
    @recipes = @current_user.recipes.order(created_at: :desc)
  end

  def show
    @current_user = current_user
    @recipe = Recipe.find(params[:id])
    @f_field = params[:field] || 'name'
    @f_order = params[:order] || 'asc'
    @rec_foods = RecipeFood.joins(:food).where(recipe_id: params[:id]).order("#{@f_field} #{@f_order}").includes(:food)
  end

  def new
    @current_user = current_user
    @recipe = Recipe.new(name: params[:name], preparation_time: params[:preparation_time],
                         cooking_time: params[:cooking_time], description: params[:description],
                         public: params[:public])
  end

  def create
    @current_user = current_user
    @recipe = @current_user.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = 'Recipe was successfully created.'
      redirect_to foods_url
    else
      flash.now[:alert] = @recipe.errors.full_messages.to_sentence
      render :new, status: 422
    end
  end

  def destroy
    @current_user = current_user
    @recipe = Recipe.find(params[:recipe][:recipe_id])
    if @recipe.destroy
      flash[:notice] = 'Recipe was successfully removed.'
    else
      flash.now[:alert] = @recipe.errors.full_messages.to_sentence
    end
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
