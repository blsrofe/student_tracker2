class Students::ObservationsController < ApplicationController
  def index
    @student = Student.find(params[:id])
    @observations = @student.observations
  end
end
