class LinksController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(links_params)
    @link.user_id = current_user.id
    if @link.valid?
      flash[:notice] = "You've successfully added a new link"
      redirect_to link_path(@link)
    else
      flash[:alert] = "Invalid entry, please try again."
      render "new"
    end
  end

  def show
    @link = Link.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(links_params)
      flash[:notice] = "You've successfully edited the link"
      redirect_to edit_link_path(@link)
    else
      flash[:alert] = "Invalid entry, please try again"
      render "edit"
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = "The link #{@link.headline} has been deleted"
    redirect_to links_path
  end

private
  def links_params
    params.require(:link).permit(:headline, :website, :user_id, :tally => 0)
  end
end
