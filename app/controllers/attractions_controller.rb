class AttractionsController < ApplicationController

   before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def show
     @user = current_user
     @attraction = Attraction.find(params[:id])
     @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
  end

  def new
    if current_user.admin
      @attraction = Attraction.new
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to new_attraction_path
    end
  end

  def edit
    authenticate_admin
  end

  def update
    authenticate_admin
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render 'edit'
    end
  end

  def destroy
    @attraction.destroy
  end


  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  end

end
