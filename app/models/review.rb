class Review < ApplicationRecord
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  belongs_to :user
  belongs_to :trail

  has_many :likes
  has_many :users, through: :likes
end
