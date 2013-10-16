class DashboardsController < ApplicationController

  def index
    @important_questions = Question.where(state: 'important').order("votes_count DESC")
    @sent_questions = Question.where(state: 'sent').order("votes_count DESC")
    @asked_questions = Question.where(state: 'asked').order("votes_count DESC")
  end

end
