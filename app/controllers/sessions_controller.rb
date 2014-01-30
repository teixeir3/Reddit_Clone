class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],
                                      params[:user][:password])

    if @user
      self.current_user = @user
      redirect_to user_url(@user)
    else
      flash.now[:errors] = "Something is wrong here"
      render :new
    end
  end

  def destroy
    session[:token] = nil
    current_user.reset_session_token!

    redirect_to new_session_url
  end
end
