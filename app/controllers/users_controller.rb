class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to new_sub_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
end
