class ThemeParksController < ApplicationController
  def index
    @theme_parks = ThemePark.all
  end

  def show
    @theme_park = ThemePark.find(params[:id])
  end
end