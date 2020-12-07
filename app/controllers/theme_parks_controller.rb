class ThemeParksController < ApplicationController
  def index
    if params[:sort]
      @theme_parks = ThemePark.select("theme_parks.*, count(rides) as ride_count")
                              .joins(:rides)
                              .group(:id)
                              .order("ride_count DESC")
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
    theme_park = ThemePark.create!({
            name: params[:name],
            city: params[:city],
            open: params[:open]
          })
        redirect_to '/themeparks'
  end

  def edit
    @theme_park = ThemePark.find(params[:id])
  end

  def update
      theme_park = ThemePark.find(params[:id])
      theme_park.update({
            name: params[:name],
            city: params[:city],
            open: params[:open]
          })
        theme_park.save
        redirect_to "/themeparks/#{theme_park.id}"
  end

  def destroy
    ThemePark.destroy(params[:id])
    redirect_to '/themeparks'
  end

  def rides
    @theme_park = ThemePark.find(params[:id])
  end

  def new_ride
    @theme_park = ThemePark.find(params[:id])
  end
  
  def create_ride
    @theme_park = ThemePark.find(params[:id])
    @theme_park.rides.create!({
      name: params[:name],
      max_occupants: params[:max_occupants],
      operational: params[:operational]
      })
    redirect_to "/themeparks/#{@theme_park.id}/rides"
  end
end