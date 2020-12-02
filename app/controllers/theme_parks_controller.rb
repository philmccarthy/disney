class ThemeParksController < ApplicationController
  def index
    @theme_parks = ThemePark.all
  end
end