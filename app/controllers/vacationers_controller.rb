class VacationersController < ApplicationController
  def index
    @vacationers = Vacationer.all
  end
end
