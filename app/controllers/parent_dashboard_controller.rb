class ParentDashboardController < ApplicationController
  def index
    @students = current_parent.students
  end

  def show
    @observation = Observation.find(params[:id])
  end
end
