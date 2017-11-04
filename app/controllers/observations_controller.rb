class ObservationsController < ApplicationController
  def index
    @observations = current_user.observations
  end

  def show
    @observation = Observation.find(params[:id])
  end

  def new
    @observation = Observation.new
  end

  def create
    @observation = Observation.new(observation_params)
    if @observation.save
      # flash[:message] = "Observation created!"
      redirect_to observations_path
    else
      # flash[:message] = "Observation was not created. Please make sure all fields are filled in."
      redirect_to new_observation_path
    end
  end

  def edit
    @observation = Observation.find(params[:id])
  end

  def update
    @observation = Observation.find(params[:id])
    @observation.update(observation_params)
    if @observation.save
    #  flash[:message] = "You updated your observation!"
     redirect_to observations_path(observation)
    else
    #  flash[:message] = "Profile was not updated. Make sure to fill in all fields."
      render :edit
    end
  end

  def destroy
    @observation = Observation.find(params[:id])
    @observation.destroy
    # flash[:message] = "Observation for has been deleted!"
    redirect_to observations_path
  end

  private
    def observation_params
      params.require(:observation).permit(:subject, :ob_type, :comment, :date, :parent_viewable, :student_id, :user_id)
    end
end
