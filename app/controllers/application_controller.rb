class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def sign_in(user)
    session[:user_id] = user.id
  end

  def authenticate_user!
    redirect_to new_session_path, alert: "Please sign in." unless session[:user_id].present?
  end
end
