class DashboardsController < ApplicationController

  def index
    @important_questions = Question.where(state: 'important')
    @sent_questions = Question.where(state: 'sent')
    @asked_questions = Question.where(state: 'asked')
  end

end
