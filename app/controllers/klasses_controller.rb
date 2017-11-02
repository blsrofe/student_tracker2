class KlassesController < ApplicationController

  def index
    @klasses = current_user.klasses
  end

  def show
    @klass = Klass.find(params[:id])
  end
end
