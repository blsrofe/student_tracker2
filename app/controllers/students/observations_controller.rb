class Students::ObservationsController < ApplicationController
  def index
    @student = Student.includes(:observations).find(params[:id])
    @observations = @student.observations
  end
end
