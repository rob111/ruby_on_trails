class Api::V1::TrailsController < ApplicationController
  def index
    render json: Trail.all
  end

  def show
    trail = Trail.find(params[:id])
    reviews = trail.reviews.order(created_at: :desc)
    usernames = []
    active_user_id = nil
    admin = false
    if current_user
      active_user_id = current_user.id
    end
    if user_signed_in?
      admin = current_user.admin?
    end
    reviews.each do |review|
      user = User.find(review.user_id)
      usernames << user.username
    end
    render json: {trail: trail, reviews: reviews, usernames: usernames, active_user_id: active_user_id, admin: admin}
  end

end
