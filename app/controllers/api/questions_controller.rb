class Api::QuestionsController < ApplicationController

  def index
    @questions = Question.where("state != ?", "expired").order("votes_count DESC, created_at")
    render json: @questions
  end

end
