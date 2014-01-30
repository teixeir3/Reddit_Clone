class SubsController < ApplicationController
  before_filter :authenticate
  before_filter :ensure_moderator, only: [:edit, :update, :destroy]

  def index
    @subs = Sub.all
  end

  def new

  end

  def create
    @sub = Sub.new(params[:sub])
    @sub.moderator = current_user

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update_attributes(params[:sub])
      render :show
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    sub = Sub.find(params[:id])
    sub.destroy

    redirect_to subs_url
  end

  private

  def ensure_moderator
    unless current_user.id == Sub.find(params[:id]).moderator_id
      redirect_to subs_url
    end
  end
end
