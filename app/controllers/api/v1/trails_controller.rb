class Api::V1::TrailsController < ApplicationController
  def index
    render json: Trail.all
  end

  def show
    trail = Trail.find(params[:id])
    reviews = trail.reviews.order(created_at: :desc)
    usernames = []
    likes = []
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
      likes << review.likes
    end
    render json: {trail: trail, reviews: reviews, usernames: usernames, active_user_id: active_user_id, admin: admin, likes: likes}
  end
end
