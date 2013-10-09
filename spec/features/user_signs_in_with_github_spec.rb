require 'spec_helper'

feature 'user signs in through github', %Q{
As a github user
I want to sign in through github
So that I can provide authentication to the API
} do

# Acceptance Criteria
# * I must have a github account

  scenario 'I sign in successfully' do
    login_with_oauth

    expect(page).to have_content("Sign out")
  end



end
