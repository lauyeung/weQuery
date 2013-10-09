require 'spec_helper'

feature 'user submits a question', %Q{
  As a launch academy student
  I want to submit a question
  So that my instructor will know what questions people have about the material and what topics need clarification
} do

  # ACCEPTANCE CRITERIA
  # * I will be able to enter a question or topic for clarification

  scenario 'user submits a question' do
    prev_count = Question.count

    login_with_oauth

    visit '/'
    fill_in 'Question', with: "What is going on?"
    click_button 'Submit'

    expect(page).to have_content('Question successfully posted')
    expect(page).to have_content('What is going on?')
    expect(Question.count).to eql(prev_count + 1)
  end
end