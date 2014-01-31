class CommentsController < ApplicationController
  before_filter :authenticate

  def new

  end

  def show
    @comment = Comment.find(params[:id])
    if @comment
      render :show

    else
      redirect_to subs_url
    end
  end

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.build(params[:comment])
    @comment.author = current_user

    if @comment.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to new_link_comment_url(@link)
    end
  end
end
