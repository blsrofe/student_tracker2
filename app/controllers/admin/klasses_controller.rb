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
  end

  def update
  end

  def destroy
  end

  private

    def klass_params
      params.require(:klass).permit(:title, :description, :school_year, :user_id)
    end
end
