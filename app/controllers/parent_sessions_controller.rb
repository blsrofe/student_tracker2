class ParentSessionsController < ApplicationController
  def new
  end

  def create
    parent = Parent.find_by(email: params[:parent_session][:email])
    if parent && authenticated?(parent)
      flash[:message] = "Login Successful"
      session[:parent_id] = parent.id
      redirect_to parent_dashboard_path
    else
      flash[:message] = "Login Unsuccessful."
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
    def authenticated?(parent)
      parent && parent.authenticate(params[:parent_session][:password])
    end
end
