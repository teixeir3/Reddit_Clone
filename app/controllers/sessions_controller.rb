class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],
                                      params[:user][:password])

    if @user
      self.current_user = @user
      redirect_to subs_url
    else
      flash.now[:errors] = ["Something is wrong here"]
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:token] = nil

    redirect_to new_session_url
  end
end
