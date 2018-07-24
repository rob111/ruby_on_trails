class Api::V1::TrailsController < ApplicationController
  def index
    render json: Trail.all
  end

  def new
    @trail = Trail.new
    render json: @trail
  end

end
