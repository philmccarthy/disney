class ThemeParksController < ApplicationController
  def index
    if params[:sort] == "ride_count"
      @theme_parks = ThemePark.select("theme_parks.*, count(rides) as ride_count")
                              .joins(:rides)
                              .group(:id)
                              .order("ride_count DESC, open DESC, created_at DESC")
    else
      @theme_parks = ThemePark.order(open: :desc, created_at: :desc)
    end
  end

  def show
    @theme_park = ThemePark.find(params[:id])
  end

  def new
  end

  def create
    theme_park = ThemePark.create!(theme_park_params)
    redirect_to '/themeparks'
  end

  def edit
    @theme_park = ThemePark.find(params[:id])
  end

  def update
      theme_park = ThemePark.find(params[:id])
      theme_park.update(theme_park_params)
      redirect_to "/themeparks/#{theme_park.id}"
  end

  def destroy
    ThemePark.destroy(params[:id])
    redirect_to '/themeparks'
  end

  def rides
    @theme_park = ThemePark.find(params[:id])
    if params[:commit]
      @rides = @theme_park.rides.order(:name)
    else
      @rides = @theme_park.rides.order(operational: :desc)
    end
  end

  def new_ride
    @theme_park = ThemePark.find(params[:id])
  end
  
  def create_ride
    @theme_park = ThemePark.find(params[:id])
    @theme_park.rides.create!(ride_params)
    redirect_to "/themeparks/#{@theme_park.id}/rides"
  end

  private
  def theme_park_params
    params.permit(:name, :city, :open)
  end

  def ride_params
    params.permit(:name, :max_occupants, :operational)
  end
end