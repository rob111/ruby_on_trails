class UsersController < ApplicationController
  before_action :authorize_user

  def show
    @user = User.new
    @users = User.order(:username)

    if params[:user] != nil
      username = params[:user][:username]
      @user = User.find_by(username: username)
    end
  end

  def index
    if params[:user][:id]
      @selected_user = User.find(params[:user][:id])
    else
      @selected_user = User.find(params[:id])
    end
  end

  def update
    @user = User.find(params[:id])
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
