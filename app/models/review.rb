class Review < ApplicationRecord
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  belongs_to :user
  belongs_to :trail

  has_many :likes
  has_many :users, through: :likes

    def vote_count
      vote_count = 0
      likes.each do |like|
        if like.vote == "like"
         vote_count += 1
       elsif like.vote == "dislike"
          vote_count -= 1
        end
      end
      return vote_count
    end
end
