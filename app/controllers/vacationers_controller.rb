class VacationersController < ApplicationController
  def index
    if params[:exact_match]
      @ordered_vacationers = Vacationer.where("first_name like ?", params[:exact_match])
    elsif params[:partial_match]
      @ordered_vacationers = Vacationer.where("first_name like ?", "%#{params[:partial_match]}%")
    else
      @ordered_vacationers = Vacationer.order(created_at: :desc)
    end
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
