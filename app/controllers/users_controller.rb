class UsersController < ApplicationController
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
    @user = current_user
  end

  def update
    current_user.update(user_params)
    if current_user.save
      flash[:message] = "You updated your profile!"
      redirect_to dashboard_path
    else
      flash[:message] = "Profile was not updated. Make sure to fill in all fields."
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
