class Api::V1::UsersController < ApplicationController

  def show
    user = User.find_by(username: params[:id])
    render json: user
  end

end
