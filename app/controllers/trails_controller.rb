class TrailsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

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
      flash.now[:notice] = @trail.errors.full_messages.join(' * ')
      render :edit
    end
  end

  def destroy
    @trail = Trail.find(params[:id])
    @trail.destroy

    flash[:notice] = 'The trail was deleted.'
    redirect_to trails_path
  end

  private
  def authorize_user
    if !user_signed_in?
      flash[:notice] = "You must be logged in to view that page."
      redirect_to root_path
    end
  end

  def trail_params
    params.require(:trail).permit(:name, :street, :city, :state, :zip, :start_latitude, :start_longitude, :length, :difficulty, :elevation, user: @user)
  end

end
