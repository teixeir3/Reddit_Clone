class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    return nil if session[:token].nil?
    @current_user ||= User.find_by_token(session[:token])
  end

  def current_user=(user)
    @current_user = user
    session[:token] = user.token
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    redirect_to new_session_url unless logged_in?
  end
end
