class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :user, :user_id, :votes

  has_many :likes

  def votes
    object.vote_count
  end

  def user
    User.find(object.user_id).username
  end

  def user_id
    object.user_id
  end

  def likes
    object.likes
  end
end
