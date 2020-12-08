class RidesController < ApplicationController
  def index
    if params[:occupants_threshold]
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
    ride.update(ride_params)
    redirect_to "/rides/#{ride.id}"
  end

  def destroy
    Ride.destroy(params[:id])
    redirect_to '/rides'
  end

  private
  def ride_params
    params.permit(:name, :max_occupants, :operational)
  end
end