class Admin::KlassesController < Admin::BaseController
  def new
    @klass = Klass.new
  end

  def create
    @klass = Klass.new(klass_params)
    if @klass.save
      flash[:message] = "#{@klass.title} successfully created!"
      redirect_to klasses_path
    else
      flash[:message] = "Class was not created. Make sure to fill in all fields"
      redirect_to new_admin_klass_path
    end
  end

  def edit
    @klass = Klass.find(params[:id])
  end

  def update
    @klass = Klass.find(params[:id])
    @klass.update(klass_params)
    if @klass.save
      flash[:message] = "You updated #{@klass.title}!"
      redirect_to klass_path(@klass)
    else
      flash[:message] = "Klass was not updated. Please try again!"
      render :edit
    end
  end

  def destroy
    @klass = Klass.find(params[:id])
    @klass.destroy
    flash[:message] = "Class has been deleted!"
    redirect_to klasses_path
  end

  private

    def klass_params
      params.require(:klass).permit(:title, :description, :school_year, :user_id)
    end
end
