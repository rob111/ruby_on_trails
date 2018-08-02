class Api::V1::LikesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def like_save(liked_record, params)
    if liked_record.save
      review = Review.find(params[:reviewId])
      votes = review.votes_count
      render json: { like: liked_record, votes: votes }
    else
      render json: { error: liked_record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def set_vote(params)
    if params[:like_id]
      liked_record = Like.find(params[:like_id])
      if params[:liked] != params[:button].downcase
        liked_record.vote = params[:button].downcase
      else
        liked_record.vote = nil
      end
      like_save(liked_record, params)
    else
      liked_record = Like.new(user_id: params[:currentUser], review_id: params[:reviewId], vote: params[:button].downcase)
      like_save(liked_record, params)
    end
  end

  def create
    if params[:button] == 'Like'
       set_vote(params)
    elsif params[:button] == 'Dislike'
      set_vote(params)
    end

  end

end
