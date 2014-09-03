class BestanswersController < ApplicationController

  def index
    @bestanswers = Bestanswer.all
  end

  def new
    @bestanswer = Bestanswer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:answer_id])
    @bestanswer = Bestanswer.new
    @bestanswer.question_id = @question.id
    @bestanswer.answer_id = @answer.id
    if @bestanswer.save
      redirect_to root_url, notice: "A new bestanswer added!"
    else
      render "new"
    end
  end
end
