class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    if params[:parent_comment_id] != nil
      @parent_comment = Comment.find(params[:parent_comment_id])
      @comment = @parent_comment.comments.create(comments_params)
      if @comment.valid?
        flash[:notice] = "Thanks for your comment!"
        redirect_to link_comments_path(@comment)
      else
        flash[:alert] = "Sorry! Your comment didn't get saved. Try again."
        redirect_to link_path(@link)
      end
    elsif params[:link_id] != nil
      @link = Link.find(params[:link_id])
      @comment = @link.comments.create(comments_params)
      if @comment.valid?
        flash[:notice] = "Thanks for your comment!"
        redirect_to link_comments_path(@comment)
      else
        flash[:alert] = "Sorry! You're in new link. Try again."
        redirect_to link_path(@link)
      end
    else
      flash[:alert] = "Sorry! You're outside. Try again."
      redirect_to link_path(@link)
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comments_params)
      flash[:notice] = "You've successfully changed your comment"
      redirect_to edit_comment_path(@comment)
    else
      flash[:alert] = "Your edit didn't take, please try again!"
      render "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "The comment has been removed"
    redirect_to link_comments_path
  end


private
  def comments_params
    params.require(:comment).permit(:opinion)
  end
end
