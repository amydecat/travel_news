class VotesController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :destroy]

  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @link = Link.find(params[:link_id])
    @vote = @link.votes.create
    if @vote.valid?
      flash[:notice] = "Thanks for your vote!"
      Link.increment_counter(:tally, @vote.link_id)
      redirect_to link_votes_path(@vote)
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
    if @vote.update(votes_params)
      flash[:notice] = "You've successfully changed your vote"
      redirect_to edit_vote_path(@vote)
    else
      flash[:alert] = "You're edit didn't take, please try again"
      render "edit"
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    Link.decrement_counter(:tally, @vote.link_id)
    @vote.destroy
    flash[:notice] = "The vote has been removed"
    redirect_to votes_path
  end

private
  def votes_params
    params.require(:vote).permit(:link_id, :user_id).merge(:user_id => current_user.id)
  end
end
