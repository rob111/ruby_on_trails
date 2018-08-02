class TrailSerializer < ActiveModel::Serializer
  attributes :id, :name, :street, :city, :state, :zip, :start_latitude, :start_longitude, :length, :difficulty, :elevation

  has_many :reviews

  def reviews
    object.reviews
  end

end
