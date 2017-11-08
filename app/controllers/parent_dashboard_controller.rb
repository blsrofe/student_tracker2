class ParentDashboardController < ApplicationController
  def index
    @students = current_parent.students
  end
end
