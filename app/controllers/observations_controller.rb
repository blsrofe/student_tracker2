class ObservationsController < ApplicationController
  before_action :require_user

  def index
    @observations = current_user.observations
  end

  def show
    @observation = Observation.find(params[:id])
  end

  def new
    @observation = Observation.new
    if current_user.admin?
      @students = Student.all
      @klass_names = Klass.pluck(:title)
    else
      @students = current_user.students
      @klass_names = current_user.klass_names
    end
  end

  def create
    @observation = Observation.new(observation_params)
    if @observation.save
      ToneAnalyzer.find_tone(@observation.id, @observation.comment)
      flash[:message] = "Observation created!"
      redirect_to observations_path
    else
      flash[:message] = "Observation was not created. Please make sure all fields are filled in."
      redirect_to new_observation_path
    end
  end

  def edit
    @observation = Observation.find(params[:id])
    if current_user.admin?
      @students = Student.all
     @klass_names = Klass.pluck(:title)
    else
      @students = current_user.students
      @klass_names = current_user.klass_names
    end
  end

  def update
    @observation = Observation.find(params[:id])
    @observation.update(observation_params)
    if @observation.save
      ToneAnalyzer.find_tone(@observation.id, @observation.comment)
      flash[:message] = "You updated your observation!"
      redirect_to observation_path(@observation)
    else
      flash[:message] = "Profile was not updated. Make sure to fill in all fields."
      render :edit
    end
  end

  def destroy
    @observation = Observation.find(params[:id])
    @observation.destroy
    flash[:message] = "Observation for has been deleted!"
    redirect_to observations_path
  end

  private
    def observation_params
      params.require(:observation).permit(:subject, :ob_type, :comment, :date, :parent_viewable, :student_id, :user_id)
    end
end
