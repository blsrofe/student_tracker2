class StudentsController < ApplicationController
  def index
    @klass = Klass.find(params[:klass_id])
    @students = @klass.students
  end
end
