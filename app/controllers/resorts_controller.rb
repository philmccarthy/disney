class ResortsController < ApplicationController

  def index
    @resorts = Resort.all
  end

  def show
    @resort = Resort.find(params[:id])
  end

  def new
  end

  def create
    resort = Resort.new({
            name: params[:name],
            amount_of_rooms: params[:amount_of_rooms],
            vacancy: params[:vacancy]
          })
        resort.save
        redirect_to '/resorts'
  end

end
