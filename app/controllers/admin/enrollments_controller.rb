class Admin::EnrollmentsController < Admin::BaseController
  def new
    @klass = Klass.find(params[:format])
    @enrollment = Enrollment.new
  end

  def create
    @klass = Klass.find(params[:enrollment][:klass_id])
    @enrollments = Enrollment.new(enrollment_params)
    if @enrollment.save
      params[:students].split(', ').each do |id|
        @klass.students << Student.find(id)
      end
      redirect_to klass_path(@klass)
    else
      redirect_to admin_dashboard_path
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:student_id, :klass_id)
  end
end
