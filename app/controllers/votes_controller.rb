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
      redirect_to root_url, notice: "A new vote added!"
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
