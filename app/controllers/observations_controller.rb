class ObservationsController < ApplicationController
  def index
    @observations = current_user.observations
  end
end
