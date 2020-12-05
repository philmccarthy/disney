class ResortsController < ApplicationController

  def index
    @resorts = Resort.all
    @ordered_resorts = @resorts.order("created_at").reverse_order
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

  def edit
    @resort = Resort.find(params[:id])
  end

  def update
    resort = Resort.find(params[:id])
    resort.update({
          name: params[:name],
          amount_of_rooms: params[:amount_of_rooms],
          vacancy: params[:vacancy]
        })
      resort.save
      redirect_to "/resorts/#{resort.id}"
  end

  def destroy
    Resort.destroy(params[:id])
    redirect_to "/resorts"
  end

  def vacationers
    @resort = Resort.find(params[:id])
  end

  def new_vacationer
    @resort = Resort.find(params[:id])
  end

  def create_vacationer
    @resort = Resort.find(params[:id])
    @resort.vacationers.create!({
      first_name: params[:first_name],
      last_name: params[:last_name],
      checked_in: params[:checked_in]
    })
    redirect_to "/resorts/#{@resort.id}/vacationers"
  end

end
