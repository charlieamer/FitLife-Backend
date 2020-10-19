class UserPreferencesController < ApplicationController
  before_action :authenticate_user
  before_action :set_user_preference

  # GET /user_preference
  def index
    render json: @user_preference
  end

  # POST /user_preference
  def create
    @user_preference = UserPreference.new(user_preference_params)

    if @user_preference.save
      render json: @user_preference, status: :created, location: @user_preference
    else
      render json: @user_preference.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_preference
  def update
    if @user_preference.nil?
      render json: nil, status: :not_found
    elsif @user_preference.update(user_preference_params)
      render json: @user_preference
    else
      render json: @user_preference.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_preference
  def destroy
    @user_preference.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_preference
      @user_preference = UserPreference.find_by user: current_user
    end

    # Only allow a trusted parameter "white list" through.
    def user_preference_params
      ret = params.require(:user_preference).permit(:calories, :protein, :carbs, :fats)
      ret[:user] = current_user
      return ret
    end
end
