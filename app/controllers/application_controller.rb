class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :parent_logged_in?
  helper_method :observation_owner?
  helper_method :user_logged_in?
  helper_method :current_parent

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_parent
    @current_parent ||= Parent.find(session[:parent_id]) if session[:parent_id]
  end

  def user_logged_in?
    current_user != nil
  end

  def parent_logged_in?
    current_parent != nil
  end

  def observation_owner?(observation)
    current_user && current_user.id == observation.user.id
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def require_user
    render file: "/public/404" unless current_user || current_admin?
  end

  def require_parent
    render file: "/public/404" unless current_parent
  end

  def require_valid_visitor
    current_parent || current_user
  end

end
