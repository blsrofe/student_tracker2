class Admin::StudentsController < Admin::BaseController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:message] = "#{@student.full_name} successfully created!"
      redirect_to admin_students_path
    else
      flash[:message] = "Student was not created. Make sure to fill in all fields"
      redirect_to new_admin_student_path
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    if @student.save
      flash[:message] = "You updated #{@student.full_name}!"
      redirect_to student_path(@student)
    else
      flash[:message] = "Student was not updated. Please try again!"
      render :edit
    end
  end

  def destroy
  end

  private
    def student_params
      params.require(:student).permit(:first_name, :last_name, :notes, :email, :grade_level)
    end
end
