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
      @questions = Question.all
      render "index"
    end
  end

  def vote

    question = Question.find(params[:question_id])
    vote = Vote.new()
    vote.user_id = current_user.id
    vote.question_id = question.id
    if vote.save
      question.check_state?
      redirect_to questions_path
    else
      redirect_to questions_path
    end
      

  end

  protected

  def question_params
    params.require(:question).permit(:content)
  end

end
