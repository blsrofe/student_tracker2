class StudentsController < ApplicationController
  def index
    @klass = Klass.includes(:students).find(params[:klass_id])
    @students = @klass.students
  end
end
