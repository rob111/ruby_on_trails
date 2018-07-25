class Trail < ApplicationRecord
  has_many :reviews
  validates :name, presence: true, uniqueness: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :zip, allow_nil: true, length: { is: 5 }
  validates :length, presence: true, numericality: true
end
