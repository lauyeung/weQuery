class Api::QuestionsController < ApplicationController

  def index
    @questions = Question.non_expired
    render json: @questions
  end

end
