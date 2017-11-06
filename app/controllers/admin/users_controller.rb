class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:message] = "Account created for #{@user.full_name}"
      redirect_to admin_dashboard_path
    else
      flash[:message] = "Account was not created. Try again!"
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:message] = "Account deleted!"
    redirect_to admin_users_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
    end
end
