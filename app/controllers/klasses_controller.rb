class KlassesController < ApplicationController

  def index
    if current_user.admin?
      @klasses = Klass.all
    else
      @klasses = current_user.klasses
    end
  end

  def show
    if current_user.admin?
      @klass = Klass.find(params[:id])
    else
      @klass = current_user.klasses.find(params[:id])
    end
  end
end
