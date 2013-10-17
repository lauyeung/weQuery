class DashboardsController < ApplicationController

  def index
    @important_questions = Question.where(state: 'important').order("votes_count DESC, created_at DESC")
    @sent_questions = Question.where(state: 'sent').order("votes_count DESC, created_at DESC")
    @asked_questions = Question.where(state: 'asked').order("votes_count DESC, created_at DESC")
  end

end
