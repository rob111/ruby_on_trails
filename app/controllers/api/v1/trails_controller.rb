class Api::V1::TrailsController < ApplicationController
  def index
    render json: Trail.all
  end

end
