class Api::QuestionsController < ApplicationController

  def index
    @questions = Question.all.order("votes_count DESC")
    render json: @questions
  end

end
