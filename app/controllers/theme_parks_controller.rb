class ThemeParksController < ApplicationController
  def index
    @theme_parks = ThemePark.all
  end

  def show
    @theme_park = ThemePark.find(params[:id])
  end

  def new
  end

  def create
    theme_park = ThemePark.new({
            name: params[:name],
            city: params[:city],
            open: params[:open]
          })
        theme_park.save
        redirect_to '/themeparks'
  end
end