class SessionsController < ApplicationController
  def new
  end

  def create
    default_login? ? user = default_login_info : user = oauth_login_info
    if user && user.admin?
      flash[:message] =  "Login Successful"
      session[:user_id] = user.id
      redirect_to admin_dashboard_path
    elsif user
      flash[:message] =  "Login Successful"
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:message] = "Login Unsuccessful. Check with your administrator if you have not been provided with an account."
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
    def authenticated?(user)
      user && user.authenticate(params[:session][:password])
    end

    def default_login?
      params[:session]
    end

    def default_login_info
      user = User.find_by(email: params[:session][:email])
      if user && authenticated?(user)
        user
      end
    end

    def oauth_login_info
      User.from_oauth(request.env["omniauth.auth"])
    end
end
