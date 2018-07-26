class Api::V1::TrailsController < ApplicationController
  def index
    render json: Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
    render json: @trail
  end


end
