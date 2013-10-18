class QuestionsController < ApplicationController


  def index
    Question.check_expiration
    @question = Question.new
    @questions = Question.where("state != ?", "expired").order("votes_count DESC, created_at")

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
    params.require(:question).permit(:body)
  end


end
