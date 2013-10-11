class Api::QuestionsController < ApplicationController

  def index
    @questions = Question.all
    render json: @questions
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      render json: @question
    else
      render json: {errors: @question.errors}, status: :unprocessable_entity
    end
  end

  def update
    @question = Question.find(params[:id])
    @vote = Vote.new({question: @question})
    if @vote.save
      @question.check_state?
      render json: @question
    else
      render status: :unprocessable_entity
    end
  end

  protected

  def question_params
    params.require(:question).permit(:body)
  end

end
