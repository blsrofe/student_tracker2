class Admin::EnrollmentsController < Admin::BaseController
  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      flash[:message] = "Enrollment successfully created!"
      redirect_to admin_dashboard_path
    else
      flash[:message] = "Enrollment not saved. Make sure to fill in all fields"
      redirect_to new_admin_enrollment_path
    end
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy
    flash[:message] = "Student has been dropped from class!"
    redirect_to klasses_path
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:student_id, :klass_id)
  end
end
