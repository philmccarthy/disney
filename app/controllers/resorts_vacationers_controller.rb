class ResortsVacationersController < ApplicationController

  def new
    @resort = Resort.find(params[:id])
  end

  def create
    @resort = Resort.find(params[:id])
    @resort.vacationers.create!(vacationer_params)
    redirect_to "/resorts/#{@resort.id}/vacationers"
  end

  private

  def vacationer_params
    params.permit(:first_name, :last_name, :checked_in)
  end


end
