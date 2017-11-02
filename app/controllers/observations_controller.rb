class ObservationsController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @observations = @student.observations
  end
end
