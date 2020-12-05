class VacationersController < ApplicationController
  def index
    @vacationers = Vacationer.all
  end

  def show
    @vacationer = Vacationer.find(params[:id])
  end

  def edit
    @vacationer = Vacationer.find(params[:id])
  end
end
