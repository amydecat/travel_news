class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.create(votes_params)
    if @vote.valid?
      flash[:notice] = "Thanks for your vote!"
      redirect_to vote_path(@vote)
    else
      flash[:alert] = "Sorry, the vote didn't take."
      render "new"
    end
  end

  def edit
    @vote = Vote.find(params[:id])
  end

  def update
    @vote = Vote.find(params[:id])
    if @vote.update(vote_params)
      flash[:notice] = "You've successfully changed your vote"
      redirect_to edit_vote_path(@vote)
    else
      flash[:alert] = "You're edit didn't take, please try again"
      render "edit"
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    flash[:notice] = "The vote has been removed"
    redirect_to votes_path
  end

private
  def votes_params
    params.require(:vote).permit(:id, like: => false)
  end
end
