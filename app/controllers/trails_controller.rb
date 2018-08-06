class TrailsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
  before_action :authorize_admin, only: [:edit, :update, :destroy]

  def index
    @trails = Trail.all
  end

  def show
  end

  def new
    if current_user
      @user = User.find(current_user.id)
      @trail = Trail.new
    end
  end

  def create
    @user = User.find(current_user.id)
    @trail = Trail.create(trail_params)
    @trail.created_by = @user.id
    if @trail.save
      flash[:notice] = "Trail added successfully"
      redirect_to trails_path
    else
      @errors = @trail.errors.full_messages
      render :new
    end
  end

  def edit
    @trail = Trail.find(params[:id])
  end

  def update
    @trail = Trail.find(params[:id])

    if @trail.update_attributes(trail_params)
      flash[:notice] = 'The trail was edited successfully.'
      redirect_to trail_path(@trail)
    else
      @errors = @trail.errors.full_messages
      render :edit
    end
  end

  def destroy
    @trail = Trail.find(params[:id])
    @trail.destroy

    if @trail.destroyed?
      flash[:notice] = 'The trail was deleted.'
      redirect_to trails_path
    else
      flash[:notice] = 'There was an error deleting the trail.'
      redirect_to trails_path
    end
  end

  private
  def authorize_user
    if !user_signed_in?
      flash[:notice] = "You must be logged in to view that page."
      redirect_to root_path
    end
  end

  def authorize_admin
    if !current_user || !current_user.admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end

  def trail_params
    params.require(:trail).permit(:name, :street, :city, :state, :zip, :start_latitude, :start_longitude, :length, :difficulty, :low_elevation, :high_elevation, :ascent, :description, :photo)
  end

end
