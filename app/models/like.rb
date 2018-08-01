class Like < ApplicationRecord
  belongs_to :user
  belongs_to :review
  # 
  # def votes_count(votes)
  #   vote_count = 0
  #   votes.each do |vote_record|
  #     if vote_record.vote == "like"
  #      vote_count += 1
  #     elsif vote_record.vote == "dislike"
  #       vote_count -= 1
  #     end
  #   end
  #   return vote_count
  # end

end
