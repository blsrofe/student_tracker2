class ObservationsController < ApplicationController
  def index
    @observations = current_user.observations
  end

  def show
    @observation = Observation.find(params[:id])
  end
end
