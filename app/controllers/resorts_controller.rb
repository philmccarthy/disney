class ResortsController < ApplicationController

  def index
    # require "pry"; binding.pry
      if params[:number_of_rooms]
        @ordered_resorts = Resort.where("amount_of_rooms > ?", params[:number_of_rooms])
      elsif params[:commit] == "Sort by number of vacationers"
        @ordered_resorts = Resort.select("resorts.*, count(vacationers) as vacationers_count")
                                .joins(:vacationers)
                                .group(:id)
                                .order("vacationers_count DESC, vacancy DESC, created_at DESC")
      elsif params[:exact_match]
        @ordered_resorts = Resort.where("name like ?", params[:exact_match])
      else
        @ordered_resorts = Resort.order(vacancy: :desc, created_at: :desc)
      end
  end

  def show
    @resort = Resort.find(params[:id])
  end

  def new
  end

  def create
    resort = Resort.create!(resort_params)
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
    if params[:commit]
      @vacationers = @resort.vacationers.order(:first_name)
    else
      @vacationers = @resort.vacationers
    end
  end

  def new_vacationer
    @resort = Resort.find(params[:id])
  end

  private

  def resort_params
    params.permit(:name, :amount_of_rooms, :vacancy)
  end

end
