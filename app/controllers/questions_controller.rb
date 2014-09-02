class QuestionsController < ApplicationController

  before_filter :authorize, only: [:edit, :update]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to root_url, notice: "A new question added!"
    else
      render "new"
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
  end

  def update
  end

private
  def question_params
     params.require(:question).permit(:title, :description, :user_id)
  end

end
