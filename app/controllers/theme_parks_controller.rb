class ThemeParksController < ApplicationController
  def index
    if params[:sort]
      @theme_parks = ThemePark.sort_by_ride_count
    elsif params[:exact_match]
      @theme_parks = ThemePark.exact_match(params[:exact_match], "name")
    elsif params[:partial_match]
      @theme_parks = ThemePark.partial_match(params[:partial_match], "name")
    else
      @theme_parks = ThemePark.default_order
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

  private
  def theme_park_params
    params.permit(:name, :city, :open)
  end
end
