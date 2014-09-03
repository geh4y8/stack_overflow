class VotesController < ApplicationController

  before_filter :authorize, only: [:edit, :update]

  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(answer_id: params[:answer])
    @vote.user_id = current_user.id
    if @vote.save
      respond_to do |format|
        format.html { redirect_to root_url}
        format.js
      end
    else
      render "new"
    end
  end

  def show
    @vote = Vote.find(params[:id])
  end

  def edit
  end

  def update
  end

private
  def vote_params
     params.require(:vote).permit(:answer_id)
  end

end
