class ReviewsController < ApplicationController
  before_action :authorize_user

  def new
    @trail = Trail.find(params[:trail_id])
    @review = Review.new
  end

  def create
    @trail = Trail.find(params[:trail_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.trail = @trail

    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to @trail
    else
      flash.now[:warning] = @review.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit

  end

  def update

  end

  def authorize_user
    if !user_signed_in? 
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
