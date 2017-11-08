class StudentsController < ApplicationController
  before_action :require_user

  def index
    @klass = Klass.includes(:students).find(params[:klass_id])
    @students = @klass.students
  end

  def show
      @student = Student.find(params[:id])
  end
end
