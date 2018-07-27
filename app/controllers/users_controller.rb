class UsersController < ApplicationController
  before_action :authorize_user
  before_action :authorize_admin, only: [:index]

  def index
    @users = User.all
  end

  def show
    if isGivenUserLoggedIn || current_user.admin?
    else
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end

  def edit
    if isGivenUserLoggedIn || current_user.admin?
      @user = User.find_by(username: params[:id])
      render :edit
    else
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end

  def update
    @user = User.find_by(username: params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
      # redirect_to "/users/#{@user.id}"
    else
      flash[:notice] = 'All fields must be completed'
      render :show
    end
  end

  private

  def authorize_user
    if !user_signed_in?
      flash[:notice] = "You need to sign in to access this page."
      redirect_to root_path
    end
  end

  def isGivenUserLoggedIn
    return params[:id] == current_user.username
  end

  def authorize_admin
    if !current_user.admin?
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
