require 'spec_helper'

feature 'user submits a question', %Q{
  As a launch academy student
  I want to submit a question
  So that my instructor will know what questions people have about the material and what topics need clarification
} do

  # ACCEPTANCE CRITERIA
  # * I will be able to enter a question or topic for clarification

  scenario 'logged-in user specifies a valid question' do
    prev_count = Question.count

    login_with_oauth

    visit '/'
    fill_in 'Question', with: "What is going on?"
    click_button 'Submit'

    expect(page).to have_content('Question successfully posted')
    expect(page).to have_content('What is going on?')
    expect(Question.count).to eql(prev_count + 1)
  end

  scenario 'logged-in user does not specify valid information' do
    prev_count = Question.count

    login_with_oauth

    visit '/'
    click_button 'Submit'

    expect(page).to have_content("can't be blank")
    expect(Question.count).to eql(prev_count)
  end

  scenario 'non-logged-in user cannot enter question' do
    visit '/'
    expect(page).to_not have_content('Questions')
    expect(page).to_not have_selector("input[type=submit]")
  end
end
