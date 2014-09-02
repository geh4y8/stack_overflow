class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      respond_to do |format|
        format.html { redirect_to root_url}
        format.js
      end
    else
      render "new"
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.delete
    respond_to do |format|
        format.html { redirect_to root_url}
        format.js
    end
  end

  private
  def answer_params
     params.require(:answer).permit(:answer_text, :question_id, :user_id)
  end
end
