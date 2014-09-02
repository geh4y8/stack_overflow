class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to root_url, notice: "A new answer added!"
    else
      render "new"
    end
  end

  private
  def answer_params
     params.require(:answer).permit(:answer_text, :question_id, :user_id)
  end
end
