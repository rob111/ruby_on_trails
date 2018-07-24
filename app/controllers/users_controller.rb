class UsersController < ApplicationController
  before_action :authorize_user

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(username: params[:id])
  end

  def edit
    @user = User.find_by(username: params[:id])
  end

  def update
    @user = User.find_by(username: params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      flash[:notice] = 'All fields must be completed'
      render :show
    end
  end

  private

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end

    def user_search_params
      params.require(:user).permit(:username, :email)
    end

    def user_params
      params.require(:user).permit(:email, :username, :password)
    end
end
