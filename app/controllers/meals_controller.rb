class MealsController < ApplicationController
  before_action :authenticate_user
  before_action :set_meal, only: [:show, :update, :destroy]

  # GET /meals[?date=2020-10-19]
  def index
    date = params[:date]
    if date.nil?
      @meals = user_meal.all
    else
      date = Date.parse(date)
      @meals = user_meal.where(created_at: date.midnight..date.end_of_day)
    end

    render json: @meals
  end

  # GET /meals/1
  def show
    render json: @meal
  end

  # POST /meals
  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      render json: @meal, status: :created, location: @meal
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meals/1
  def update
    if @meal.update(meal_params)
      render json: @meal
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meals/1
  def destroy
    @meal.destroy
  end

  private
    def user_meal
      Meal.owned_by current_user
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = user_meal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meal_params
      ret = params.require(:meal).permit(:food, :calories, :protein, :carbs, :fats)
      ret[:user] = current_user
      return ret
    end
end
