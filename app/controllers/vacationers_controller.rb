class VacationersController < ApplicationController
  def index
    @vacationers = Vacationer.all
    @ordered_vacationers = @vacationers.order("created_at").reverse_order
  end

  def show
    @vacationer = Vacationer.find(params[:id])
  end

  def edit
    @vacationer = Vacationer.find(params[:id])
  end

  def update
    vacationer = Vacationer.find(params[:id])
    vacationer.update({
      first_name: params[:first_name],
      last_name: params[:last_name],
      checked_in: params[:checked_in]
      })
      vacationer.save
      redirect_to "/vacationers/#{vacationer.id}"
  end

  def destroy
    Vacationer.destroy(params[:id])
    redirect_to '/vacationers'
  end
end
