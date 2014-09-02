class BestanswersController < ApplicationController

  def index
    @bestanswers = Bestanswer.all
  end

  def new
    @bestanswer = Bestanswer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @bestanswer = Bestanswer.new(bestanswer_params)
    @bestanswer.user_id = current_user.id
    @bestanswer.question_id = @question.id
    @bestanswer.answer_id = @answer.id
    if @bestanswer.save
      redirect_to root_url, notice: "A new bestanswer added!"
    else
      render "new"
    end
  end


private
  def bestanswer_params
     params.require(:bestanswer).permit(:user_id, :bestanswer_id)
  end
end
