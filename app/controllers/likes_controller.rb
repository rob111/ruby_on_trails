class LikesController < ApplicationController


  def create
    # binding.pry
    @review = Review.find(params[:review_id])
    @like = Like.create(user_id: current_user.id, review: @review)
    @review.like.to_i =  1
    @trail = Trail.find(params[:trail_id])

    if @like.save
      flash[:notice] = "You liked this review"
      redirect_to @trail
    else
      flash.now[:warning] = "like wasn't added"
      redirect_to @trail
    end
  end

end
