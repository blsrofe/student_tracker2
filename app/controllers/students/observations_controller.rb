class Students::ObservationsController < ApplicationController
  before_action :require_valid_visitor

  def index
    if current_user
      @student = Student.includes(:observations).find(params[:id])
      @observations = @student.observations
    elsif current_parent
      @student = Student.includes(:observations).find(params[:id])
      @observations = @student.observations.where(parent_viewable: true)
    end
  end
end
