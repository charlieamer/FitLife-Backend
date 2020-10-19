class UserController < ApplicationController
  before_action :authenticate_user, except: [:create]

  # GET /user
  def index
    render json: current_user
  end

  # POST /user
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
