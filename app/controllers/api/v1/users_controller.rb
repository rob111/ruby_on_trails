class Api::V1::UsersController < ApplicationController

  def show
    user = User.find_by(username: params[:id])
    review_count = user.reviews.length
    render json: {user: user, review_count: review_count}
  end

end
