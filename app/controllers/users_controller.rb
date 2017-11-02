class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.save
      current_user.update(user_params)
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
