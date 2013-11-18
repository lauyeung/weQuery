require 'spec_helper'

feature 'admin user views the dashboard', %Q{
  As an authenticated user
  I want to view the dashboard
  So that I can see what questions need to be answered
} do

  scenario 'user visits the dashboard' do
    admin_login_with_oauth

    visit '/'
    click_link 'Dashboard'
    expect(page).to have_content('Questions')
  end

end
