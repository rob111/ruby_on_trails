class Trail < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :name, presence: true, uniqueness: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :length, presence: true
end
