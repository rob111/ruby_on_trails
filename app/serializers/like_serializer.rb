class LikeSerializer < ActiveModel::Serializer
  attributes :vote, :user_id, :id

  belongs_to :review
end
