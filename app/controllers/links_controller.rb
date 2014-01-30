class LinksController < ApplicationController

  def new
    @subs = Sub.all
  end

  def create
    @link = Link.new(params[:link])
    @link.author = current_user

    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      @subs = Sub.all
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])

  end

  def edit
    @link = Link.find(params[:id])
    @subs = Sub.all
  end

  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(params[:link])
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end


end
