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

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:message] = "Account deleted!"
    redirect_to admin_users_path
  end

  def make_teacher
    @user = User.find(params[:format])
    @user.teacher!
    redirect_to admin_users_path
  end

  def make_admin
    @user = User.find(params[:format])
    @user.admin!
    redirect_to admin_users_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
    end

    def toggle_user(user)
      if user.admin?
        user.teacher!
      elsif user.teacher?
        user.admin!
      end
    end

end
