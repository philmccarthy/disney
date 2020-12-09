class ThemeParksRidesController < ApplicationController
  def new
    @theme_park = ThemePark.find(params[:id])
  end
  
  def create
    @theme_park = ThemePark.find(params[:id])
    @theme_park.rides.create!(ride_params)
    redirect_to "/themeparks/#{@theme_park.id}/rides"
  end

  private
  def ride_params
    params.permit(:name, :max_occupants, :operational)
  end
end