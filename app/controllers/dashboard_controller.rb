class DashboardController < ApplicationController

  before_action :is_admin?

  def index
    @important_questions = Question.where(state: 'important').order("votes_count DESC, created_at")
    @sent_questions = Question.where(state: 'sent').order("votes_count DESC, created_at")
    @asked_questions = Question.where(state: 'asked').order("votes_count DESC, created_at")
  end

  protected

  def is_admin?
    if !current_user || !current_user.admin
      redirect_to questions_path
    end
  end

end
