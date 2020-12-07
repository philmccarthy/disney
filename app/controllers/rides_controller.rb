class RidesController < ApplicationController
  def index
    if params[:occupants_threshold] && params[:occupants_threshold] != ""
      @rides = Ride.all
                   .min_occupants(params[:occupants_threshold])
                   .order(operational: :desc, created_at: :desc)
    else
      @rides = Ride.order(operational: :desc, created_at: :desc)
    end
  end

  def show
    @ride = Ride.find(params[:id])
  end
  
  def edit
    @ride = Ride.find(params[:id])
  end

  def update
    ride = Ride.find(params[:id])
    ride.update({
      name: params[:name],
      max_occupants: params[:max_occupants],
      operational: params[:operational]
      })
    ride.save
    redirect_to "/rides/#{ride.id}"
  end

  def destroy
    Ride.destroy(params[:id])
    redirect_to '/rides'
  end
end