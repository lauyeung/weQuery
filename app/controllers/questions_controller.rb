class QuestionsController < ApplicationController

  def index
    @question = Question.new
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if current_user && @question.save
      redirect_to questions_path, notice: "Question successfully posted"
    else
      render "index"
    end
  end

  protected

  def question_params
    params.require(:question).permit(:content)
  end

end
