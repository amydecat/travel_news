class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(links_params)
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

private
  def links_params
    params.require(:link).permit(:id, :headline, :website)
  end
end
