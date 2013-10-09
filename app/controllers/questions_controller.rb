class QuestionsController < ApplicationController

  def index
    @question = Question.new
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path, notice: "Question successfully posted"
    else
      render "/questions"
    end
  end

  protected

  def question_params
    params.require(:question).permit(:content)
  end

end
