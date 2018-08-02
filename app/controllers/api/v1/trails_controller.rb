class Api::V1::TrailsController < ApplicationController
  def index
    render json: Trail.all
  end

  def show
    trail = Trail.find(params[:id])
    reviews = ActiveModel::Serializer::ArraySerializer.new(trail.reviews.order(created_at: :desc), each_serializer: ReviewSerializer)
    if current_user
      current_user_id = current_user.id
      current_user_admin = current_user.admin?
    else
      current_user_id = nil
      current_user_admin = false
    end

    render json: {trail: trail, reviews: reviews, current_user: {id: current_user_id, admin: current_user_admin}}

  end
end
