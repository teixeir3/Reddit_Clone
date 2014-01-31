class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

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

    unless logged_in?
      flash[:errors] = ["LOG IN, IDIOT!"]
      redirect_to new_session_url
    end
  end
end
