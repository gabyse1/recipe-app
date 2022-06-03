class FoodsController < ApplicationController
  def index
    @curret_user = current_user
    @f_order = params[:order] || 'asc'
    @foods = Food.all.order("name #{@f_order}")
  end

  def new
    @current_user = current_user
    @food = Food.new(name: params[:name], measurement_unit: params[:meas_unit], price: params[:price])
  end

  def create
    @current_user = current_user
    @food = @current_user.foods.new(food_params)
    if @food.save
      flash[:notice] = 'Food was successfully created.'
      redirect_to foods_url
    else
      flash.now[:alert] = @food.errors.full_messages.to_sentence
      render :new, status: 422
    end
  end

  def destroy
    @current_user = current_user
    @food = Food.find(params[:food][:food_id])
    if @food.destroy
      flash[:notice] = 'Food was successfully removed.'
    else
      flash.now[:alert] = @food.errors.full_messages.to_sentence
    end
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
