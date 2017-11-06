class KlassesController < ApplicationController

  def index
    if current_user.admin?
      @klasses = Klass.all
    else
      @klasses = current_user.klasses
    end
  end

  def show
    @klass = Klass.find(params[:id])
  end
end
