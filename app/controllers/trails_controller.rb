class TrailsController < ApplicationController
  # before_action :authorize_user
  def index
    @trails = Trail.all
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
    @trail.user = @user
    if @trail.save
      flash[:notice] = "Trail added successfully"
      redirect_to trails_path
    else
      flash.now[:warning] = @trail.errors.full_messages.join(', ')
      render :new
    end
  end

  def authorize_user
    if !user_signed_in?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end

  private
  def trail_params
    params.require(:trail).permit(:name, :street, :city, :state, :zip, :start_latitude, :start_longitude, :length, :difficulty, :elevation, user: @user)
  end

end
