class Trail < ApplicationRecord

  mount_uploader :photo, PhotoUploader

  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, allow_nil: true, length: { is: 5 }
  validates :length, presence: true, numericality: true
end
