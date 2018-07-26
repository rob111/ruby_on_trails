class Api::V1::TrailsController < ApplicationController
  def index
    render json: Trail.all
  end

  def show
    trail = Trail.find(params[:id])
    reviews = trail.reviews.order(created_at: :desc)
    usernames = []
    active_user_id = nil
    if current_user
      active_user_id = current_user.id
    end
    reviews.each do |review|
      user = User.find(review.user_id)
      usernames << user.username
    end
    render json: {trail: trail, reviews: reviews, usernames: usernames, active_user_id: active_user_id}
  end


end
