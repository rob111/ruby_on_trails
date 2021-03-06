class TrailShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :street, :city, :state, :zip, :start_latitude, :start_longitude, :length, :difficulty, :description, :ascent, :photo, :low_elevation, :high_elevation

  has_many :reviews

  def reviews
    object.reviews
  end
end
